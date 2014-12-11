class HomeController < ApplicationController
  before_action :set_locale

  before_filter :authenticate_user!,
    :only => [:structure]

  def index
    if current_user
      page = current_user.curr_page
      if page != nil
        redirect_to :controller => 'pages', :action => 'show', :id => page
      end
    end
  end

  def structure
    # set locale
    current_user.locale = params[:locale] || session[:locale]
    current_user.save()

    if !current_user.curr_entry
      @entry = Entry.new
      @entry.user = current_user
      @entry.save()
      questions = Question.all
      questions.each do |q|
        a = Answer.new
        a.question = q
        a.entry = @entry
        a.save()
      end
      current_user.curr_entry = @entry.id
      current_user.save()
    end
  end

  def review_answers
    @sections = Section.all
    if current_user.curr_entry
      @entry = Entry.find(current_user.curr_entry)
      @answers = @entry.answers
    else
      section = Section.find_by(seq_no: 4)
      redirect_to :controller => 'sections', :action => 'show', :id => section.id, :flash => { :notice => "No current form entry in progress" }
    end
  end

  def submit
    pdftk = PdfForms.new(ENV["PDFTK_PATH"])
    @entry = Entry.find(current_user.curr_entry)
    @entry_answers = @entry.answers
    answers = {}

    @entry_answers.each do |a|
      if a.question.field_type == 'string' or
         a.question.field_type == 'date' or
         a.question.field_type == 'text'
        answers[a.question.form_id] = a.text
      elsif a.question.field_type == 'checkbox'
        if a.text == a.question.checkbox_value
          answers[a.question.form_id] = a.question.checkbox_value
        end
      end
    end

    @entry.completed_at = Time.now()
    @entry.save()

    form_path = Rails.public_path.to_s + '/i589.pdf'
    tmp_path = "#{Rails.root.to_s}/tmp/" + @entry.id.to_s

    pdftk.fill_form form_path, tmp_path, answers
    send_file(tmp_path, :filename => 'i589.pdf', :type => "application/pdf", :disposition => 'inline')
  end

  def submit_to_translator
    @entry = Entry.find(current_user.curr_entry)

    @entry.needs_translation = true
    @entry.locale = current_user.locale
    @entry.completed_at = Time.now()

    @entry.save()
  end

  def show_submission
    @message = 'Submitted form stub'
    @tmp_path
  end

  # def set_locale
  #   if !session[:locale]
  #     I18n.locale = current_user.locale
  #     session[:locale] = I18n.locale
  #   else
  #     I18n.locale = session[:locale]
  #   end
  #   if current_user
  #     current_user.locale = I18n.locale
  #     current_user.save()
  #   end
  # end

end
