class AddProfileIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :profile_id, :integer
    add_index :songs, [:profile_id, :created_at]
  end
end
