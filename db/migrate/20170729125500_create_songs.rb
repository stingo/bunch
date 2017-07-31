class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :description
      t.string :songcover
      t.string :audio
      t.text :lyricsbody1
      t.text :lyricschorus1
      t.text :lyricsbody2
      t.text :lyricschorus2
      t.text :lyricsbody3
      t.text :lyricschorus3
      t.string :youtubeurl
      t.string :slug

      t.timestamps
    end
  end
end
