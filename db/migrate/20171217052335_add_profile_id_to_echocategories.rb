class AddProfileIdToEchocategories < ActiveRecord::Migration[5.1]
  def change
    add_column :echocategories, :profile_id, :integer

    add_index :echocategories, [:profile_id, :created_at]
  end
end
