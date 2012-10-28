module Refinery
  module Works
    class Work < Refinery::Core::BaseModel
      self.table_name = 'refinery_works'

      attr_accessible :caption, :dimension, :year, :picture_id, :position

      acts_as_indexed :fields => [:caption, :dimension, :year]

      validates :caption, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
