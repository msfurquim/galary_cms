module Refinery
  module CurrentShows
    class CurrentShowsController < ::ApplicationController

      before_filter :find_all_current_shows
      before_filter :find_page

      def index
        @current_show = @current_shows.first
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @current_show in the line below:
        present(@page)
        render :action => :show
      end

      def show
        @current_show = CurrentShow.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @current_show in the line below:
        present(@page)
      end

    protected

      def find_all_current_shows
        @current_shows = CurrentShow.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/current_shows").first
      end

    end
  end
end
