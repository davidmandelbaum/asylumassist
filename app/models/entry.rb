class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  def get_section_answers (section)
    answers_out = []        
    answers.each do |a|
      if a.section == section
        answers_out << a
      end
    end
    return answers_out
  end

  def get_page_answers (page)
    answers_out = []
    answers_in = answers
    answers_in.each do |a|
      if a.page == page
        answers_out << a
      end
    end
    form_text_in = FormText.all
    form_text_in.each do |f|
      if f.page == page
        answers_out << f
      end
    end
    answers_out = answers_out.sort_by { |a| a.seq_no }
    return answers_out
  end

  def get_translate_answers
    answers_out = []

    answers.each do |a|
      if a.question.translate
        answers_out << a
      end
    end
    answers_out = answers_out.sort_by { |a| a.page.seq_no }
    return answers_out
  end

end
