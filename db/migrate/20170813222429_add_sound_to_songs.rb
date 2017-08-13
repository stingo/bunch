class AddSoundToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :sound, :string
  end
end
