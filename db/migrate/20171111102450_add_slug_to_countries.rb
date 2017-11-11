class AddSlugToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :slug, :string
    add_index :countries, :slug
  end
end
