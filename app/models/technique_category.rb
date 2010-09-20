class TechniqueCategory < ActiveRecord::Base
  puret :name
  has_many :techniques
  accepts_nested_attributes_for :translations, :allow_destroy => true
  validates_presence_of :code
end