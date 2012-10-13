module Refinery
  module Catalogues
    class Catalogue < Refinery::Core::BaseModel

      self.table_name = 'refinery_catalogues'

      attr_accessible :author, :caption, :year, :cover_id, :attach_id, :position

      acts_as_indexed :fields => [:author, :caption, :year]

      validates :author, :presence => true

      belongs_to :cover, :class_name => '::Refinery::Image'

      belongs_to :attach, :class_name => '::Refinery::Resource'
    end
  end
end
