class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :thing_locations

	has_many :locations, through: :thing_locations
	
	has_many :events, dependent: :destroy

	mount_uploader :pesnavatar, PesnavatarUploader
	mount_uploader :profilecover, ProfilecoverUploader
end
