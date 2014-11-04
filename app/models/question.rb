class Question < ActiveRecord::Base
  belongs_to :page
  translates :name, :explanation
end
