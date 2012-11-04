module Refinery
  module Works
    module Admin
      class WorksController < ::Refinery::AdminController

        crudify :'refinery/works/work',
                :title_attribute => 'caption', :xhr_paging => true

        def index
          if params[:artist_id]
            # @artist = ::Refinery::Artists::Artist.find(params[:artist_id])
            paginate_works({:artist_id => params[:artist_id]})
          else
            # @artist = ::Refinery::Artists::Artist.first
            paginate_works()
          end
        end

        private
        def paginate_works(conditions={})
          # logger.debug "conditions #{conditions.inspect}"

          @works = ::Refinery::Works::Work.where(conditions).
                                paginate(:page => params[:page], :per_page => ::Refinery::Works::Work.per_page()).
                                order('position DESC')
        end

      end
    end
  end
end
