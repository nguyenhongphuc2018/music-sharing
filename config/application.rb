require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)
module MusicShared
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = "Hanoi"
    config.active_record.default_timezone = :local
  end
end
