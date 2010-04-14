class TechniqueType < ActiveRecord::Base
  has_many :techniques

  validates_presence_of :name, :symbol
end
