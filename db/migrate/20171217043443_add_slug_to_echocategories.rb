class AddSlugToEchocategories < ActiveRecord::Migration[5.1]
  def change
    add_column :echocategories, :slug, :string

    add_index :echocategories, :slug
  end
end
