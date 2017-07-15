class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_many :thing_locations

	has_many :locations, through: :thing_locations
	has_many :events

	mount_uploader :psnavatar, PsnavatarUploader
	mount_uploader :profilecover, ProfilecoverUploader
end
