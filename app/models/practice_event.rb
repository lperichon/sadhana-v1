class PracticeEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  validates :user, :presence => true
  validates :practice, :presence => true
  validates :start, :presence => true

  def title
    self.practice.name
  end
end
