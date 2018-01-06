class AddProfileIdToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :profile_id, :integer
    add_index :genres, :profile_id
  end
end
