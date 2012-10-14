module Refinery
  module PastShows
    module Admin
      class PastShowsController < ::Refinery::AdminController

        crudify :'refinery/past_shows/past_show',
                :title_attribute => 'year', :xhr_paging => true

      end
    end
  end
end
