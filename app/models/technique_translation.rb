class TechniqueTranslation < ActiveRecord::Base
  puret_for :technique
  validates_presence_of :name
end