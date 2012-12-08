module Refinery
  module Biographies
    class BiographiesController < ::ApplicationController

      before_filter :find_all_biographies
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @biography in the line below:
        present(@page)
      end

      def show
        @biography = Biography.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @biography in the line below:
        present(@page)
      end

    protected

      def find_all_biographies
        @biographies = Biography.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/biographies").first
      end

    end
  end
end
