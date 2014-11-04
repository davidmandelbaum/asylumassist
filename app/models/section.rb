class Section < ActiveRecord::Base
  has_many :pages
  translates :name, :guidance
end
