class Question < ActiveRecord::Base
  belongs_to :page

  # translations
  translates :name, :explanation

end
