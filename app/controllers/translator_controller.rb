class TranslatorController < ApplicationController

  def list
    @entries = Entry.where(needs_translation: true)
  end

  def show
    @entry = Entry.find(params[:id])

    @answers = @entry.get_translate_answers

    @locale = @entry.locale

  end

  def submit
    @entry = Entry.find(params[:entry])

    params.each do |k, v|
      if k.include? "answer"
        a_id = k[7..-1].to_i
        a = Answer.find(a_id)
        a.translated_text = v
        a.save()
      end
    end

    @entry.save()

    # fill PDF form
    
    pdftk = PdfForms.new(ENV["PDFTK_PATH"])
    @entry_answers = @entry.answers
    answers = {}

    @entry_answers.each do |a|
      if a.question.field_type == 'string' or
         a.question.field_type == 'date' or
         a.question.field_type == 'text'
        if a.translated_text
          answers[a.question.form_id] = a.translated_text
        else
          answers[a.question.form_id] = a.text
        end
      elsif a.question.field_type == 'checkbox'
        if a.text == a.question.checkbox_value
          answers[a.question.form_id] = a.question.checkbox_value
        end
      end
    end

    @entry.completed_at = Time.now()
    @entry.needs_translation = false
    @entry.save()

    form_path = Rails.public_path.to_s + '/i589.pdf'
    tmp_path = "#{Rails.root.to_s}/tmp/" + @entry.id.to_s

    pdftk.fill_form form_path, tmp_path, answers
    
    UserNotifier.translation_ready_email(@entry, tmp_path).deliver

    redirect_to action: 'list'

  end

end
