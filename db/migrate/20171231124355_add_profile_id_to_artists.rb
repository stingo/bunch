class AddProfileIdToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :profile_id, :integer
    add_index :artists, :profile_id
  end
end
