HoptoadNotifier.configure do |config|
  if Rails.env == 'development'
    config = YAML.load_file("#{Rails.root}/config/hoptoad.yml")
  else
    config.api_key = ENV['HOPTOAD_API_KEY']
    config.js_notifier = true
  end
end
