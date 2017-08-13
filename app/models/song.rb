class Song < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"

	mount_uploader :songcover, SongcoverUploader

	mount_uploader :sound, SoundUploader
    
    is_impressionable



	

     extend FriendlyId
  friendly_id :title, use: :slugged


    
end
