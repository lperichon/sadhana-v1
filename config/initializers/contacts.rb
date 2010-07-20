config = {
  :google => {
    :consumer_key => ENV['GOOGLE_CONSUMER_KEY'],
    :consumer_secret => ENV['GOOGLE_CONSUMER_SECRET']
  },
  :yahoo => {
    :consumer_key => ENV['YAHOO_CONSUMER_KEY'],
    :consumer_secret => ENV['YAHOO_CONSUMER_SECRET']
  },
  :windows_live => {
    :application_id => ENV['WINDOWSLIVE_APP_ID'],
    :secret_key => ENV['WINDOWSLIVE_CONSUMER_KEY'],
    :privacy_policy_url => ENV['WINDOWSLIVE_POLICY_URL']
  }
}
Contacts.configure(config)