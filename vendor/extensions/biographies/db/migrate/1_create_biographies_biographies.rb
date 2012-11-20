class CreateBiographiesBiographies < ActiveRecord::Migration

  def up
    create_table :refinery_biographies do |t|
      t.text :content
      t.integer :artist_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-biographies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/biographies/biographies"})
    end

    drop_table :refinery_biographies

  end

end
