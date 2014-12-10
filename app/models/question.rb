class Question < ActiveRecord::Base
  belongs_to :page
  has_many :answers

  serialize :validations

  # translations
  translates :name, :explanation

  def answer_text(entry_id)
    answer = Answer.where(entry_id: entry_id, question: self).first
    if answer
      return answer.text
    else
      return nil
    end
  end

end
