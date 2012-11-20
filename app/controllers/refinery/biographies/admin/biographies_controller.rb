module Refinery
  module Biographies
    module Admin
      class BiographiesController < ::Refinery::AdminController

        crudify :'refinery/biographies/biography', :xhr_paging => true

        def index
          if params[:artist_id]
            @artist = ::Refinery::Artists::Artist.find(params[:artist_id])
            if @artist.biography.blank?
              # redirect_to :action => :new, :artist_id => params[:artist_id]
             redirect_to "/refinery/biographies/new?artist_id=#{@artist.id}"
            else
              # redirect_to :action => :edit, :artist_id => params[:artist_id]
              redirect_to "/refinery/biographies/edit?artist_id=#{@artist.id}"
            end
          else
            redirect_to refinery.artists_admin_artists_path, :flash => 'Please select an artist'
          end
        end

        def new
          @artist = ::Refinery::Artists::Artist.find(params[:artist_id])
          @biography = @artist.build_biography
        end

      end
    end
  end
end
