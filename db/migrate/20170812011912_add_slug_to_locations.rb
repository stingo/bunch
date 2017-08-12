class AddSlugToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :slug, :string

    add_index :locations, :slug
  end
end
