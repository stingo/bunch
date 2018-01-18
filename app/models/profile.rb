class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :thing_locations
    has_many :locations, through: :thing_locations

    has_many :thing_skills
    has_many :skills, through: :thing_skills


    has_many :products
    has_many :companytypes

    has_many :countries
    has_many :echocategories
    has_many :howcategories



	has_many :thing_industries
    has_many :industries, through: :thing_industries
    


    #Destroy object when profile is removed	
	has_many :events, dependent: :destroy
	has_many :jobs, dependent: :destroy
	has_many :hows, dependent: :destroy
	has_many :songs, dependent: :destroy
	has_many :urbanterms, dependent: :destroy
	has_many :companies, dependent: :destroy
	has_many :listings, dependent: :destroy
	has_many :echos, dependent: :destroy
	has_many :comments, dependent: :destroy 
	has_many :artists
	has_many :genres
	has_many :ads, dependent: :destroy 



	mount_uploader :pesnavatar, PesnavatarUploader
	mount_uploader :profilecover, ProfilecoverUploader

	accepts_nested_attributes_for :thing_locations #allow_destroy: true
	accepts_nested_attributes_for :thing_skills #allow_destroy: true

	acts_as_votable
	acts_as_voter

	acts_as_follower
    acts_as_followable
   


	#validations
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :date_of_birth, presence: true
	#validates :is_female, presence: { message: "? Gender can't be blank" }

	

	






	is_impressionable


	extend FriendlyId
    friendly_id :full_name, use: :slugged

    def full_name
    "#{first_name} #{last_name}"
    end

     def should_generate_new_friendly_id?
    last_name_changed?
  end



end
