class AddHowcategoryIdToHows < ActiveRecord::Migration[5.1]
  def change
    add_column :hows, :howcategory_id, :integer
    add_index :hows, :howcategory_id
  end
end
