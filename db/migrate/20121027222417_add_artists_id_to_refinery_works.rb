class AddArtistsIdToRefineryWorks < ActiveRecord::Migration
  def change
    add_column :refinery_works, :artist_id, :integer
  end
end
