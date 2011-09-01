class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :practice_parts, :order => "position", :dependent => :destroy
  has_many :practice_events, :dependent => :destroy

  has_many :shared_practices
  has_many :viewers, :through => :shared_practices, :class_name => 'User', :source => :user
  
  acts_as_list :scope => :user

  validates :user, :presence => true
  validates :name, :presence => true
  validates :delay, :presence => true
  validates :delay, :numericality => true

  after_initialize :initialize_values

  state_machine :state, :initial => :created do
    event :archive do
      transition all => :archived
    end
    event :restore do
      transition :archived => :created
    end
  end

  default_scope without_state(:archived)


  def initialize_values
    self.delay ||= 1
  end

  def total_time
    self.practice_parts.all.sum {|pp| pp.total_time }
  end

  def sound_filename
    filename = read_attribute(:sound_filename)
    filename = 'chime' if filename.blank?
    filename
  end

  def share_with(user)
    ShareMailer.share_notification(self, user).deliver
    self.viewers << user
    self.save
  end

  def duplicate
    clone = self.clone
    clone.state = 'created'
    clone.position = nil
    self.practice_parts.each do |pp|
      pp_clone = pp.clone
      pp.practice_techniques.each do |pt|
        pp_clone.practice_techniques << pt.clone
      end
      clone.practice_parts << pp_clone
    end
    clone
  end
end
