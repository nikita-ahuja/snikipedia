require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# FOR SAFE KEEPING OF API TOKENS IN .env
# Just add them below in the format below.
Dotenv::Railtie.load
# HOSTNAME = ENV['HOSTNAME']
# GITHUB_ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']
# GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']

module Snikipedia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
