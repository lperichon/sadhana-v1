HoptoadNotifier.configure do |config|
  if Rails.env == 'development'
    dev_config = YAML.load_file("#{Rails.root}/config/hoptoad.yml")
    config.api_key = dev_config['api_key']
  else
    config.api_key = ENV['HOPTOAD_API_KEY']
  end
  config.js_notifier = true
end
