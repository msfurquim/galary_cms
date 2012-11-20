module Refinery
  module Biographies
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Biographies

      engine_name :refinery_biographies

      initializer "register refinerycms_biographies plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "biographies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.biographies_admin_biographies_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/biographies/biography'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Biographies)
      end
    end
  end
end
