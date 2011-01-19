if Rails.env == 'development'
  Facebooker2.load_facebooker_yaml
else
  config = {
    :app_id => ENV['FACEBOOK_APP_ID'],
    :secret => ENV['FACEBOOK_APP_SECRET'],
    :api_key => ENV['FACEBOOK_API_KEY']
  }
  Facebooker2.configuration=config
end