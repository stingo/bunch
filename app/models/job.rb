class Job < ApplicationRecord
	has_many :thing_locations

	has_many :thing_skills

    has_many :skills, through: :thing_skills

    #has_many :profiles, through: :thing_skills

    belongs_to :profile

    has_many :locations, through: :thing_locations

    accepts_nested_attributes_for :thing_locations #allow_destroy: true
    accepts_nested_attributes_for :thing_skills #allow_destroy: true
end
