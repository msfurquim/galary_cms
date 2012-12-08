module Refinery
  module Biographies
    class Biography < Refinery::Core::BaseModel
      self.table_name = 'refinery_biographies'

      attr_accessible :artist_id, :content, :position

      acts_as_indexed :fields => [:content]

      validates :content, :presence => true, :uniqueness => true
      validates :artist_id, :presence => true, :uniqueness => true
    end
  end
end
