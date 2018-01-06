class Song < ApplicationRecord
	belongs_to :profile, foreign_key: "profile_id"
	belongs_to :artist, :optional => true
	belongs_to :genre, :optional => true

#carrierwavw
	mount_uploader :songcover, SongcoverUploader
	mount_uploader :sound, SoundUploader

#paperclip
  has_attached_file :mp3
validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }
    
  is_impressionable

  extend FriendlyId
  friendly_id :title, use: :slugged

   def should_generate_new_friendly_id?
    title_changed?
  end
end
