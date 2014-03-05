source 'http://rubygems.org'
ruby '2.1.1'

gem 'rails', '~> 4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 4.0.0"
  gem 'coffee-rails', "~> 4.0.0"
  gem 'uglifier'
end

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
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'ruby_parser'
  gem 'hpricot'
  gem 'powder'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'yaml_db'
  gem 'letter_opener'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'poltergeist', git: 'git://github.com/jonleighton/poltergeist.git'
  gem 'fivemat'
  gem 'capybara-screenshot'
end

group :production do
  gem 'thin'
end

gem "newrelic_rpm"

gem "exception_notification", :git => "git://github.com/rails/exception_notification", :require => 'exception_notifier'
gem 'pg'
gem 'devise'
gem 'formtastic'
gem 'squeel'
#gem 'mini_exiftool'
gem 'will_paginate'
gem 'rdiscount'
gem 'paperclip'
#gem 'acts_as_markup'
gem 'haml'

gem 'slugtastic'
