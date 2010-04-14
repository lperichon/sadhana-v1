class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :practice_techniques, :order => "position"

  validates :user, :presence => true
  validates :name, :presence => true
  validates :delay, :presence => true
  validates :delay, :numericality => true

  after_initialize :initialize_values

  def initialize_values
    self.delay ||= 1
  end
end
