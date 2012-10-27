class AddGenderToArtistsArtists < ActiveRecord::Migration
  def up
    add_column :refinery_artists, :gender, :string
  end

  def down
    remove_column :refinery_artists, :gender
  end
end
