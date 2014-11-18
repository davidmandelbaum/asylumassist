class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :entry

  def section
    question.page.section
  end

  def page
    question.page
  end

end
