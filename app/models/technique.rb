class Technique < ActiveRecord::Base
  belongs_to :technique_type
  belongs_to :parent, :class_name => "Technique", :foreign_key => "parent_id"
  has_many :children, :class_name => 'Technique', :foreign_key => 'parent_id'
  has_attached_file :photo,:storage => :s3,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_ACCESS_KEY_ID'].to_s,
                      :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'].to_s},
                    :bucket => ENV['S3_BUCKET'].to_s,
                    :styles => { :thumb => "100x100>", :medium => "370x450>"},
                    :default_url => "/images/missing_:style.png", :path => ":attachment/:id/:style/:filename"
  puret :name, :description
  validates_presence_of :technique_type

  def family_members
    if self.parent.present?
      self.parent.family_members
    else
      family_members = []
      family_members << self
      family_members.concat self.children
    end
  end
end
