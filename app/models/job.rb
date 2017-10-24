class Job < ApplicationRecord
	has_many :thing_locations
	has_many :locations, through: :thing_locations

	has_many :thing_skills
    has_many :skills, through: :thing_skills


    has_many :thing_companies
    has_many :companies, through: :thing_companies


    has_many :thing_industries
    has_many :industries, through: :thing_industries



    #has_many :profiles, through: :thing_skills

    belongs_to :profile

    

    accepts_nested_attributes_for :thing_locations #allow_destroy: true
    accepts_nested_attributes_for :thing_skills #allow_destroy: true
    accepts_nested_attributes_for :thing_companies #allow_destroy: true
end
