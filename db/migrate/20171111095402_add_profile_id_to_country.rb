class AddProfileIdToCountry < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :profile_id, :integer
    add_index :countries, [:profile_id, :created_at]
  end
end
