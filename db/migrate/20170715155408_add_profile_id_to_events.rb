class AddProfileIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :profile_id, :integer


    add_index :events, [:profile_id, :created_at]
  end
end
