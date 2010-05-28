class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :practice_techniques, :order => "position", :dependent => :destroy
  has_many :practice_events, :dependent => :destroy
  acts_as_list :scope => :user

  validates :user, :presence => true
  validates :name, :presence => true
  validates :delay, :presence => true
  validates :delay, :numericality => true

  after_initialize :initialize_values

  def initialize_values
    self.delay ||= 1
  end
end
