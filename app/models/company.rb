class Company < ApplicationRecord
	has_many :thing_locations
	has_many :locations, through: :thing_locations


	has_many :thing_companies
    has_many :jobs, through: :thing_companies
    has_many :listings, through: :thing_companies

    has_many :profiles, through: :thing_companies
	



	belongs_to :profile

	validates :name, presence: true
end
