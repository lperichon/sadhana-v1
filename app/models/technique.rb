class Technique < ActiveRecord::Base
  belongs_to :technique_type

  validates_presence_of :name, :technique_type
end
