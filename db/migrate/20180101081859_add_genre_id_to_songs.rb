class AddGenreIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :genre_id, :integer
    add_index :songs, :genre_id
  end
end
