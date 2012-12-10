module Refinery
  module Exhibitions
    class Exhibition < Refinery::Core::BaseModel
      self.table_name = 'refinery_exhibitions'

      attr_accessible :artist_id, :content, :position

      acts_as_indexed :fields => [:content]

      validates :content, :presence => true
      validates :artist_id, :presence => true, :uniqueness => true

      belongs_to :artist, :class_name => '::Refinery::Artists::Artist'

      def title
        self.artist.name + "\'s Exhibitions"
      end
    end
  end
end
