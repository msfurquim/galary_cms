module Refinery
  module CurrentShows
    module Admin
      class CurrentShowsController < ::Refinery::AdminController

        crudify :'refinery/current_shows/current_show',
                :title_attribute => 'caption', :xhr_paging => true

      end
    end
  end
end
