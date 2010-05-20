require 'acts_as_subscriber'

ActiveRecord::Base.class_eval do
  include Saas::Acts::Subscriber
end
