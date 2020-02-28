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

    config.load_defaults 6.0


      config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.jbuilder false
    end

  #config.assets.paths << Rails.root.join('app', 'assets', 'select2')


  end
end
