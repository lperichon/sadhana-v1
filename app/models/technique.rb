class Technique < ActiveRecord::Base
  belongs_to :technique_type
  belongs_to :technique_category
  belongs_to :parent, :class_name => "Technique", :foreign_key => "parent_id"
  has_many :children, :class_name => 'Technique', :foreign_key => 'parent_id'
  has_attached_file :photo,:storage => :s3,
                    :s3_credentials => {
                      :access_key_id => Paperclip.s3_config[:access_key_id],
                      :secret_access_key => Paperclip.s3_config[:secret_access_key]},
                    :bucket => Paperclip.s3_config[:bucket],
                    :styles => { :thumb => "100x100>", :medium => "370x410>"},
                    :default_url => "/images/missing_:style.png", :path => ":attachment/:id/:style/:filename"
  puret :name, :description
  accepts_nested_attributes_for :translations, :allow_destroy => true
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
