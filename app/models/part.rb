class Part < ActiveRecord::Base
  puret :name
  accepts_nested_attributes_for :translations, :allow_destroy => true
end
