class AddCategoryToRefineryWorks < ActiveRecord::Migration
  def change
    add_column :refinery_works, :category, :string
  end
end
