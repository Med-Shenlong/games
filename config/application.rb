require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Games
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.


    config.site = {
     name: 'Games'

    }
    config.assets.initialize_on_precompile = true
    config.load_defaults 6.0
    config.serve_static_assets = true

      config.generators do |g|
      g.helper false
      g.test_framework false
      g.jbuilder false
    end




  end
end
