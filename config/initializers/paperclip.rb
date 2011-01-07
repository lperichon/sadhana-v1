module Paperclip

  def self.s3_config
    s3_config = {}
    if Rails.env == 'development'
      s3_config = YAML.load_file("#{Rails.root}/config/s3.yml")
    else
      s3_config[:access_key_id] = ENV['S3_ACCESS_KEY_ID']
      s3_config[:secret_access_key] = ENV['S3_SECRET_ACCESS_KEY']
      s3_config[:bucket] = ENV['S3_BUCKET']
    end
    s3_config.symbolize_keys!
  end

  class Tempfile < ::Tempfile
    # Fix for ruby 1.9.2
    def make_tmpname(basename, n)
      extension = File.extname(basename)
      sprintf("%s,%d,%s%s", File.basename(basename, extension), $$, n, extension)
    end
  end
end