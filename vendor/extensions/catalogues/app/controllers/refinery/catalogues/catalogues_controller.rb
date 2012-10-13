module Refinery
  module Catalogues
    class CataloguesController < ::ApplicationController

      before_filter :get_year
      before_filter :find_all_catalogues
      before_filter :find_page

      def index
        @years = Catalogue.uniq.pluck('year')
        @current_year = params[:year] || Time.now.year.to_s
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @catalogue in the line below:
        present(@page)
      end

      def show
        @catalogue = Catalogue.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @catalogue in the line below:
        present(@page)
      end

    protected
      def get_year
        @years = Catalogue.uniq.pluck('year')
        @current_year = params[:year] || Time.now.year.to_s
      end

      def find_all_catalogues
        @catalogues = Catalogue.where(:year => @current_year).
                                order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/catalogues").first
      end

    end
  end
end
