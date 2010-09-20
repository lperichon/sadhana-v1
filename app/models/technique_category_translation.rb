class TechniqueCategoryTranslation < ActiveRecord::Base
  puret_for :technique_category
  validates_presence_of :name
end