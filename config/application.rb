require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rcg
  class Application < Rails::Application
    %W{app/presenters app/interactors}.each do |p|
      config.autoload_paths += [config.root.join(p)]
    end

    config.web_console.whitelisted_ips = '10.0.2.2'
    config.web_console.development_only = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
