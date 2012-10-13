module Refinery
  module Catalogues
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Catalogues

      engine_name :refinery_catalogues

      initializer "register refinerycms_catalogues plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "catalogues"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.catalogues_admin_catalogues_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/catalogues/catalogue',
            :title => 'author'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Catalogues)
      end
    end
  end
end
