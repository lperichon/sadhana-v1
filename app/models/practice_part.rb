class PracticePart < ActiveRecord::Base
  belongs_to :practice
  belongs_to :part
  acts_as_list :scope => :practice

  validates :practice, :presence => true
  validates :part, :presence => true
end