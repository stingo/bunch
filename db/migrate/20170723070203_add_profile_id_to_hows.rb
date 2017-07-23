class AddProfileIdToHows < ActiveRecord::Migration[5.1]
  def change
    add_column :hows, :profile_id, :integer

    add_index :hows, [:profile_id, :created_at]
  end
end
