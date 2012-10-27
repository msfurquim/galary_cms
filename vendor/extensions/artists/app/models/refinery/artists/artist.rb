module Refinery
  module Artists
    class Artist < Refinery::Core::BaseModel
      self.table_name = 'refinery_artists'

      attr_accessible :name, :gender, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
