class FormText < ActiveRecord::Base
  belongs_to :page

  serialize :validations
end
