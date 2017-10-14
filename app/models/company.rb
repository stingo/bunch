class Company < ApplicationRecord
	has_many :thing_locations
	has_many :locations, through: :thing_locations


	has_many :thing_companies
    has_many :jobs, through: :thing_companies
    has_many :listings, through: :thing_companies

    has_many :profiles, through: :thing_companies
	



	belongs_to :profile, foreign_key:"profile_id"

	validates :name, presence: true

	mount_uploader :companylogo, CompanylogoUploader
	mount_uploader :companycover, CompanycoverUploader

    acts_as_ordered_taggable
      acts_as_taggable_on :tags, :skills

      after_commit :remove_companycover!, on: :destroy
  #after_commit :delete_empty_dirs!, on: :destroy
     


end
