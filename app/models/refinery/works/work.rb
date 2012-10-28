module Refinery
  module Works
    class Work < Refinery::Core::BaseModel
      self.table_name = 'refinery_works'

      attr_accessible :caption, :dimension, :year, :picture_id, :position, :artist_id, :category

      acts_as_indexed :fields => [:caption, :dimension, :year, :category]

      validates :caption, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
      belongs_to :artist, :class_name => '::Refinery::Artists::Artist'
    end
  end
end
