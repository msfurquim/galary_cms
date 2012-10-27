# This migration comes from refinery_artists (originally 1)
class CreateArtistsArtists < ActiveRecord::Migration

  def up
    create_table :refinery_artists do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-artists"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/artists/artists"})
    end

    drop_table :refinery_artists

  end

end
