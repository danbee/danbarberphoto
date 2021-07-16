source "http://rubygems.org"
ruby "2.7.2"

gem "dotenv-rails", groups: %i[development test]

gem "rails", "~> 5.1"

# Bundle edge Rails instead:
# gem "rails", :git => "git://github.com/rails/rails.git"

gem "administrate"
gem "administrate-field-image"
gem "bourbon"
gem "coffee-rails"
gem "dragonfly"
gem "dragonfly-s3_data_store"
gem "jquery-rails"
gem "kaminari"
gem "kramdown"
gem "mime-types"
gem "nokogiri"
gem "oath"
gem "oath-generators"
gem "pg"
gem "sass-rails"
gem "simple_form"
gem "slugtastic"
gem "uglifier"
gem "unf"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "powder"
  gem "ruby_parser"
  gem "standardrb"
end

group :test, :development do
  gem "pry"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "rubocop"
end

group :test do
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "fivemat"
  gem "poltergeist"
  gem "shoulda"
  gem "simplecov"
end

group :production do
  gem "puma"
  gem "rails_12factor"
end
