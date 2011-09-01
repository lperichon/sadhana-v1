# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sadhana::Application.initialize!

require File.expand_path('../../lib/omniauth/strategies/facebook_decorator', __FILE__)
