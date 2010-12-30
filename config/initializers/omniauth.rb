Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == 'development'
    config = YAML.load_file("#{Rails.root}/config/omniauth.yml")
  else
    config = {
      :twitter => {
        :consumer_key => ENV['TWITTER_CONSUMER_KEY'],
        :consumer_secret => ENV['TWITTER_CONSUMER_SECRET']
      },
      :facebook => {
        :app_id => ENV['FACEBOOK_APP_ID'],
        :app_secret => ENV['FACEBOOK_APP_SECRET']
      }
    }
  end
  config.symbolize_keys!
  provider :twitter, config[:twitter][:consumer_key], config[:twitter][:consumer_secret]
  provider :facebook, config[:facebook][:app_id], config[:facebook][:app_secret], :scope => 'offline_access, publish_stream, email'
  #provider :open_id, OpenID::Store::Memcache.new(Dalli::Client.new)
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end