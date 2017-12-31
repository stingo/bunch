class Song < ApplicationRecord
	belongs_to :profile, foreign_key: "profile_id"
	belongs_to :artist

	mount_uploader :songcover, SongcoverUploader
	mount_uploader :sound, SoundUploader
    
  is_impressionable

  extend FriendlyId
  friendly_id :title, use: :slugged

   def should_generate_new_friendly_id?
    title_changed?
  end
end
