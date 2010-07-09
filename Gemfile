source 'http://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '3.0.0.beta4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'ryanb-acts-as-list', '0.1.2', :require => 'acts_as_list'
gem 'devise', '1.1.rc2'
gem 'lperichon-devise_invitable','0.3.0', :require => 'devise_invitable'
gem 'paperclip', '2.3.2'
gem 'nokogiri', '1.4.1'
gem 'high_voltage', '0.9.0', :branch => "rails3"
gem 'active_merchant', '1.5.2', :require => 'active_merchant'
gem 'money', '3.0.0'
gem 'state_machine', '0.9.1'
gem 'lockfile', '1.4.3'
gem 'fastercsv', '1.5.3'
gem 'puret', '1.0.3'
gem 'will_paginate', '3.0.pre'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end

group :development do
  gem "ruby-debug"
  gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3'
end

group :test do
  gem "machinist"
  gem "faker"
  gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3'
end

group :production do
  gem 'mysql', '2.8.1'
  gem 'mongrel', '1.1.5'
  gem "thin", '1.2.7'
end

