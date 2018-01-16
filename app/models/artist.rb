class Artist < ApplicationRecord

	belongs_to :profile
	has_many :songs
    is_impressionable
    acts_as_taggable

    mount_uploader :artistphoto, ArtistphotoUploader
	mount_uploader :artistprofilecover, ArtistprofilecoverUploader

	extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
