class Technique < ActiveRecord::Base
  belongs_to :technique_type
  has_attached_file :photo,:storage => :s3,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_ACCESS_KEY_ID'].to_s,
                      :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'].to_s},
                    :bucket => ENV['S3_BUCKET'].to_s,
                    :styles => { :thumb => "100x100>", :medium => "370x450>"},
                    :default_url => "/images/missing_:style.png"
  validates_presence_of :name, :technique_type
end
