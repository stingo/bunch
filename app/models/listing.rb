class Listing < ApplicationRecord


	has_many :thing_companies
    has_many :companies, through: :thing_companies






	belongs_to :profile, foreign_key: "profile_id"

	is_impressionable




  mount_uploaders :listingimages, ListingimageUploader
  #serialize :avatars, JSON # If you use SQLite, add this line.

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
