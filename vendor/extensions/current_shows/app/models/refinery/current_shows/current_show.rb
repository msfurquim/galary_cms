module Refinery
  module CurrentShows
    class CurrentShow < Refinery::Core::BaseModel
      self.table_name = 'refinery_current_shows'

      attr_accessible :begin_date, :end_date, :caption, :content, :position

      acts_as_indexed :fields => [:caption, :content]

      validates :caption, :presence => true, :uniqueness => true

      def date_title
        return "#{begin_date.strftime('%d.%m.')} - #{end_date.strftime('%d.%m.%Y')}"
      end
    end
  end
end
