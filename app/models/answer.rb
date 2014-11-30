class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :entry

  def section
    question.page.section
  end

  def seq_no
    question.seq_no
  end

  def page
    question.page
  end

end
