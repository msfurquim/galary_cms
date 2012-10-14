# This migration comes from refinery_current_shows (originally 1)
class CreateCurrentShowsCurrentShows < ActiveRecord::Migration

  def up
    create_table :refinery_current_shows do |t|
      t.date :begin_date
      t.date :end_date
      t.string :caption
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-current_shows"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/current_shows/current_shows"})
    end

    drop_table :refinery_current_shows

  end

end
