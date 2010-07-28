class PracticeTechnique < ActiveRecord::Base
  belongs_to :practice
  belongs_to :practice_part
  belongs_to :technique
  has_and_belongs_to_many :techniques
  acts_as_list :scope => :practice_part

  after_initialize :initialize_practice_technique

  validates :practice_part, :presence => true
  validates :technique, :presence => true
  validates :minutes, :presence => true, :numericality => true
  validates :seconds, :presence => true, :numericality => true

  def add_technique_id=(technique_id)
    t = Technique.find(technique_id)
    techniques << t unless techniques.include?(t)
  end

  def remove_technique_id=(technique_id)
    techniques.delete(Technique.find(technique_id))
  end

  private

  def initialize_practice_technique
    self.minutes ||= 0
    self.seconds ||= 1
  end
end