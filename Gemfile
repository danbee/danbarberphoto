source 'http://rubygems.org'
ruby '2.2.2'

gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '~> 4.1.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sass-rails', "  ~> 5.0.0"
gem 'coffee-rails', "~> 4.1.0"
gem 'uglifier'

gem 'bourbon'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'aws-sdk'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development do
  gem 'sqlite3'
  gem 'ruby_parser'
  gem 'hpricot'
  gem 'powder'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'tunnel'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'fivemat'
  gem 'capybara-screenshot'
  gem 'simplecov'
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

gem 'newrelic_rpm'

gem 'exception_notification', :git => 'git://github.com/rails/exception_notification', :require => 'exception_notifier'
gem 'pg'
gem 'devise'
gem 'simple_form'
gem 'squeel'
#gem 'mini_exiftool'
gem 'will_paginate'
gem 'redcarpet'
gem 'dragonfly'
gem 'dragonfly-s3_data_store'
gem 'unf'
gem 'haml'

gem 'slugtastic'
