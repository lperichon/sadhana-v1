class Technique < ActiveRecord::Base
  belongs_to :technique_type
  has_attached_file :photo, :styles => { :thumb => "100x100>" }
  validates_presence_of :name, :technique_type
end
