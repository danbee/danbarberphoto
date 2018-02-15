source 'http://rubygems.org'
ruby '2.4.2'

gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '~> 5.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'administrate'
gem 'administrate-field-image'
gem 'aws-sdk'
gem 'bourbon'
gem 'coffee-rails'
gem 'dragonfly'
gem 'dragonfly-s3_data_store'
gem 'jquery-rails'
gem 'kaminari'
gem 'kramdown'
gem 'mime-types'
gem 'nokogiri'
gem 'oath'
gem 'oath-generators'
gem 'pg'
gem 'sass-rails'
gem 'simple_form'
gem 'slugtastic'
gem 'uglifier'
gem 'unf'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development do
  gem 'ruby_parser'
  gem 'powder'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rubocop'
  gem 'pry'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda'
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
