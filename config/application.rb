require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Npcatalog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.media_path = 'D:/Downloads/npcatalog'
    # config.text_file_path = 'C:/Users/Vincent/OneDrive/links.txt'
    config.text_file_path = 'D:/Downloads/npcatalog/dump.txt'

    config.serve_static_files = true
    paths['public'] = config.media_path

    # middleware.use ::ActionDispatch::Static,
    #                config.media_path,
    #                index: 'index'
  end
end
