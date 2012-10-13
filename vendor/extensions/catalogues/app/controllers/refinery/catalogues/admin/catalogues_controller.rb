module Refinery
  module Catalogues
    module Admin
      class CataloguesController < ::Refinery::AdminController

        crudify :'refinery/catalogues/catalogue',
                :title_attribute => 'author', :xhr_paging => true

      end
    end
  end
end
