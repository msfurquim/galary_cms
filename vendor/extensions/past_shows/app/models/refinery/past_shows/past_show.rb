module Refinery
  module PastShows
    class PastShow < Refinery::Core::BaseModel
      self.table_name = 'refinery_past_shows'

      attr_accessible :year, :caption, :content, :position

      acts_as_indexed :fields => [:year, :caption, :content]

      validates :year, :presence => true
    end
  end
end
