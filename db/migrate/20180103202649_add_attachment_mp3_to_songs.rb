class AddAttachmentMp3ToSongs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :songs do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :songs, :mp3
  end
end
