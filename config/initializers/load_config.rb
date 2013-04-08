# Load the app config from the config.yml file.
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env].with_indifferent_access
