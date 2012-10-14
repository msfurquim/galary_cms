module Refinery
  module CurrentShows
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CurrentShows

      engine_name :refinery_current_shows

      initializer "register refinerycms_current_shows plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "current_shows"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.current_shows_admin_current_shows_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/current_shows/current_show',
            :title => 'caption'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CurrentShows)
      end
    end
  end
end
