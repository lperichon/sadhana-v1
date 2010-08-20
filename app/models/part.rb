class Part < ActiveRecord::Base
  puret :name
  accepts_nested_attributes_for :translations, :allow_destroy => true
  belongs_to :technique_type
  has_and_belongs_to_many :technique_types

  def ordered_technique_types
    ott = []
    ott << self.technique_type
    ott.concat self.technique_types
    ott
  end
end
