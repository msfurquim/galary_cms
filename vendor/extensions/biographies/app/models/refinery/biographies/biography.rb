module Refinery
  module Biographies
    class Biography < Refinery::Core::BaseModel
      self.table_name = 'refinery_biographies'

      attr_accessible :content, :artist_id, :position

      acts_as_indexed :fields => [:content]

      validates :content, :presence => true, :uniqueness => true
    end
  end
end
