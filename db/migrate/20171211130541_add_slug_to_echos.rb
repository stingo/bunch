class AddSlugToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :slug, :string

    add_index :echos, :slug
  end
end
