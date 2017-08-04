class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :thing_locations

	has_many :locations, through: :thing_locations
	
	has_many :events, dependent: :destroy
	has_many :hows, dependent: :destroy

	mount_uploader :pesnavatar, PesnavatarUploader
	mount_uploader :profilecover, ProfilecoverUploader


	#validations
	validates :first_name, presence: true
	validates :last_name, presence: true






	is_impressionable


	extend FriendlyId
    friendly_id :full_name, use: :slugged

    def full_name
    "#{first_name} #{last_name}"
    end



end
