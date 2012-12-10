module Refinery
  module Exhibitions
    class Exhibition < Refinery::Core::BaseModel
      self.table_name = 'refinery_exhibitions'

      attr_accessible :artist_id, :content, :position

      acts_as_indexed :fields => [:content]

      validates :content, :presence => true, :uniqueness => true
    end
  end
end
