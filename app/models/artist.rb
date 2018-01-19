class Artist < ApplicationRecord

	belongs_to :profile
	has_many :songs
    is_impressionable
    acts_as_taggable
    belongs_to :genre

    mount_uploader :artistphoto, ArtistphotoUploader
	mount_uploader :artistprofilecover, ArtistprofilecoverUploader
	mount_uploaders :photos, PhotosUploader


   validate :photos_count_validation, :if => "photos?"  

  def photos_count_validation
    errors[:photos] << "should be less than 5" if photos.count > 4
  end


	extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
