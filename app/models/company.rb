class Company < ApplicationRecord

	is_impressionable

  # Normalizes the attribute itself before validation



  # Conditionally normalizes the attribute
  #hony_normalize :recipient, default_country_code: 'US', if: -> { contactphone == 'contactphone' }







	has_many :thing_locations
	has_many :locations, through: :thing_locations


	has_many :thing_companies
    has_many :jobs, through: :thing_companies
    has_many :listings, through: :thing_companies

    has_many :profiles, through: :thing_companies

    


    has_many :thing_industries
    has_many :industries, through: :thing_industries

    has_many :thing_countries
    has_many :countries, through: :thing_countries
	
has_many :jobs

	belongs_to :profile, foreign_key:"profile_id"
	belongs_to :companytype, :optional => true
	belongs_to :companysize, :optional => true

	validates :name, presence: true



  #validates :contactphone,:presence => true,
                 #:numericality => true,
                 #:length => { :minimum => 10, :maximum => 15 }

  #validates :contactphone, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
                              #message: 'bad format')}

	#validates :contactphone,   :presence => {:message => 'Business contact phone required!'},
                     #:numericality => true,
                     #:length => { :minimum => 10, :maximum => 15 }


   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :companyemail, presence: true, length: { maximum: 105 },

uniqueness: { case_sensitive: false },

format: { with: VALID_EMAIL_REGEX }



	mount_uploader :companylogo, CompanylogoUploader
	mount_uploader :companycover, CompanycoverUploader

    acts_as_ordered_taggable
      acts_as_taggable_on :tags, :skills

      after_commit :remove_companycover!, on: :destroy
  #after_commit :delete_empty_dirs!, on: :destroy
     
     

     extend FriendlyId
         friendly_id :name, use: :slugged

 

  def should_generate_new_friendly_id?
    name_changed?
  end

  #validations
	validates :name, presence: true
	validates :location_ids, presence: { message: "? Company location can't be blank" }
	
	#validates :is_female, presence: { message: "? Gender can't be blank" }


end
