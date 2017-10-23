class Company < ApplicationRecord

	is_impressionable

	has_many :thing_locations
	has_many :locations, through: :thing_locations


	has_many :thing_companies
    has_many :jobs, through: :thing_companies
    has_many :listings, through: :thing_companies

    has_many :profiles, through: :thing_companies
	



	belongs_to :profile, foreign_key:"profile_id"
	belongs_to :companytype, :optional => true
	belongs_to :companysize, :optional => true

	validates :name, presence: true

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
