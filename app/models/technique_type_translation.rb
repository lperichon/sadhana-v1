class TechniqueTypeTranslation < ActiveRecord::Base
  puret_for :technique_type
  validates_presence_of :name
end
