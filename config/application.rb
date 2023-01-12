require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

def merge_encyrpted_credentials_into_env!
  credentials = Rails.application.credentials
  credentials = credentials.config.transform_keys { |key| key.to_s.underscore.upcase }
  env = ENV.slice(*credentials.keys)
  ENV.merge! credentials.merge(env)
end

module HaleyCapstone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    merge_encyrpted_credentials_into_env!
  end
end
