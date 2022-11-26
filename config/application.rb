require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Turbochat
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = 'Singapore'
  end
end
