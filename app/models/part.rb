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

  def primary_technique_type
    ".#{self.technique_type.symbol}"
  end

  def secondary_technique_types
    str = ""
    self.technique_types.each_with_index do |tt, index|
      str << ", " if index > 0
      str << ".#{tt.symbol}"
    end
    str
  end
end
