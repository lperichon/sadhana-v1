class PracticeEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  validates :user, :presence => true
  validates :practice, :presence => true
  validates :start, :presence => true
  validate :validate_start_string

  def title
    self.practice.name
  end

  def start_string
    self.start.strftime('%Y-%m-%d %H:%M') if self.start
  end

  def start_string=(start_str)
    self.start = Time.zone.parse(start_str) 
    rescue ArgumentError
      @start_invalid = true
  end

  def validate_start_string
    errors.add(:start_string, "is invalid") if @start_invalid
  end

  def practice
    if self[:practice_id] && self[:practice].nil?
      Practice.unscoped.find(self[:practice_id])
    else
      self[:practice]
    end
  end
end
