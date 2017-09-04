class AddProfileIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :profile_id, :integer

    add_index :products, [:profile_id, :created_at]
  end
end





