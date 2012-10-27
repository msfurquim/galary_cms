class AddGenderToRefineryArtists < ActiveRecord::Migration
  def change
    add_column :refinery_artists, :gender, :string
  end
end
