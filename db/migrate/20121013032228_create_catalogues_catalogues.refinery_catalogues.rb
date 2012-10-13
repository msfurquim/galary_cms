# This migration comes from refinery_catalogues (originally 1)
class CreateCataloguesCatalogues < ActiveRecord::Migration

  def up
    create_table :refinery_catalogues do |t|
      t.string :author
      t.string :caption
      t.string :year
      t.integer :cover_id
      t.integer :attach_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-catalogues"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/catalogues/catalogues"})
    end

    drop_table :refinery_catalogues

  end

end
