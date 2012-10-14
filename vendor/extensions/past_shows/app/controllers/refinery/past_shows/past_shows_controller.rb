module Refinery
  module PastShows
    class PastShowsController < ::ApplicationController

      before_filter :find_all_past_shows
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @past_show in the line below:
        @past_show = @past_shows.first
        present(@page)
        render :action => :show
      end

      def show
        @past_show = PastShow.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @past_show in the line below:
        present(@page)
      end

    protected

      def find_all_past_shows
        @past_shows = PastShow.order('year desc, position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/past_shows").first
      end

    end
  end
end
