module Refinery
  module Works
    module Admin
      class WorksController < ::Refinery::AdminController

        crudify :'refinery/works/work',
                :title_attribute => 'caption', :xhr_paging => true

      end
    end
  end
end
