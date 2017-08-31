class AddProfileIdToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :profile_id, :integer

    add_index :listings, [:profile_id, :created_at]
  end
end
