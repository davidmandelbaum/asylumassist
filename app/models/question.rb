class Question < ActiveRecord::Base
  belongs_to :page
  has_one :answer

  serialize :validations

  # translations
  translates :name, :explanation

  def answer_text
    if answer
      return answer.text
    else
      return ""
    end
  end

end
