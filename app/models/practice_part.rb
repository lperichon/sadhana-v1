class PracticePart < ActiveRecord::Base
  belongs_to :practice
  belongs_to :part
  has_many :practice_techniques, :order => "position", :dependent => :destroy
  acts_as_list :scope => :practice

  validates :practice, :presence => true
  validates :part, :presence => true

  def total_time
    self.practice_techniques.all.sum {|pt| (pt.minutes*60 + pt.seconds + (self.practice.continuous ? self.practice.delay : 0)) * (pt.compensate ? 2 : 1) }
  end
end