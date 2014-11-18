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
    answers.each do |a|
      if a.page == page
        answers_out << a
      end
    end
    return answers_out
  end

end
