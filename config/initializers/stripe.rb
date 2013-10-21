config = {}
if Rails.env == 'development'
  config = YAML.load_file("#{Rails.root}/config/stripe.yml")
else
  config = {
          :stripe_api_key => ENV['STRIPE_API_KEY'],
          :stripe_public_key => ENV['STRIPE_PUBLIC_KEY']
  }
end

Stripe.api_key = config[:stripe_api_key]
STRIPE_PUBLIC_KEY = config[:stripe_public_key]