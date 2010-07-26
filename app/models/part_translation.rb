class PartTranslation < ActiveRecord::Base
  puret_for :part
  validates_presence_of :name
end
