class Page < ActiveRecord::Base
  belongs_to :section
  has_many :questions
  has_many :form_texts

  def elements
    elements = []
    self.questions.each do |q|
      elements << q
    end
    self.form_texts.each do |f|
      elements << f
    end
    elements.sort! { |a,b| a.seq_no <=> b.seq_no }
    return elements
  end
end
