class CreatePastShowsPastShows < ActiveRecord::Migration

  def up
    create_table :refinery_past_shows do |t|
      t.string :year
      t.string :caption
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-past_shows"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/past_shows/past_shows"})
    end

    drop_table :refinery_past_shows

  end

end
