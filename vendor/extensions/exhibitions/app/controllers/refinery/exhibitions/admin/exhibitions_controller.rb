module Refinery
  module Exhibitions
    module Admin
      class ExhibitionsController < ::Refinery::AdminController

        crudify :'refinery/exhibitions/exhibition', :xhr_paging => true

      end
    end
  end
end
