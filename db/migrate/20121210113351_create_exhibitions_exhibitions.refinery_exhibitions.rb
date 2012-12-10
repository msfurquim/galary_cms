# This migration comes from refinery_exhibitions (originally 1)
class CreateExhibitionsExhibitions < ActiveRecord::Migration

  def up
    create_table :refinery_exhibitions do |t|
      t.integer :artist_id
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-exhibitions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/exhibitions/exhibitions"})
    end

    drop_table :refinery_exhibitions

  end

end
