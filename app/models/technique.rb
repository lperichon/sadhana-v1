class Technique < ActiveRecord::Base
  belongs_to :technique_type
  has_attached_file :photo,:storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
                    :styles => { :thumb => "100x100>"},
                    :default_url => "/images/missing_:style.png", :path => ":attachment/:id/:style/:filename"
  validates_presence_of :name, :technique_type
end
