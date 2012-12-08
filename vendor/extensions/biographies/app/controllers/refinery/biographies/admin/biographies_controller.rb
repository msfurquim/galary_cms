module Refinery
  module Biographies
    module Admin
      class BiographiesController < ::Refinery::AdminController

        crudify :'refinery/biographies/biography', :xhr_paging => true

      end
    end
  end
end
