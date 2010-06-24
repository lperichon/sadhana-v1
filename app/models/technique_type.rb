class TechniqueType < ActiveRecord::Base
  puret :name
  has_many :techniques
  accepts_nested_attributes_for :translations, :allow_destroy => true  
  validates_presence_of :symbol
end
