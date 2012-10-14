module Refinery
  module PastShows
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PastShows

      engine_name :refinery_past_shows

      initializer "register refinerycms_past_shows plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "past_shows"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.past_shows_admin_past_shows_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/past_shows/past_show',
            :title => 'year'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PastShows)
      end
    end
  end
end
