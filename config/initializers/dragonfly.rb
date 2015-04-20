require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "02f4922399e3faca75b1faaa0a05bd46b524419459628110e733041af6df183b"

  url_format "/media/:job/:name"

  if %w[development test].include? Rails.env
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  else
    datastore :s3,
      bucket_name: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_KEY'],
      secret_access_key: ENV['AWS_SECRET'],
      region: 'eu-west-1'
  end

  processor :preview do |content| content.process! :thumb, '600x600' end

  processor :admin do |content| content.process! :thumb, '140x140#' end

  processor :size17 do |content| content.process! :thumb, '476x476#' end
  processor :size11 do |content| content.process! :thumb, '308x308#' end
  processor :size8  do |content| content.process! :thumb, '224x224#' end
  processor :size5  do |content| content.process! :thumb, '140x140#' end
  processor :size3  do |content| content.process! :thumb, '84x84#' end
  processor :size2  do |content| content.process! :thumb, '56x56#' end

  processor :size17x2 do |content| content.process! :thumb, '952x952#' end
  processor :size11x2 do |content| content.process! :thumb, '616x616#' end
  processor :size8x2  do |content| content.process! :thumb, '448x448#' end
  processor :size5x2  do |content| content.process! :thumb, '280x280#' end
  processor :size3x2  do |content| content.process! :thumb, '168x168#' end
  processor :size2x2  do |content| content.process! :thumb, '112x112#' end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
