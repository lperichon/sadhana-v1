Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'rlIKIFp98svCqZ07CtyMg', 'RNeXKTP7RNM0oZ5K8anz1IXlJAx4qpdlLxW1qk4XI'
  provider :facebook, '188062824541861', '2fb1213831287b92cd7762b122387696'
  #provider :open_id, OpenID::Store::Memcache.new(Dalli::Client.new)
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end