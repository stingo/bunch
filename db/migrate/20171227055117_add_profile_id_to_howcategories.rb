class AddProfileIdToHowcategories < ActiveRecord::Migration[5.1]
  def change
    add_column :howcategories, :profile_id, :integer
    add_index :howcategories, [:profile_id, :created_at]
  end
end
