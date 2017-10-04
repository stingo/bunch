class Skill < ApplicationRecord
	has_many :thing_skills
    has_many :profiles, through: :thing_skills

    has_many :jobs, through: :thing_skills

    accepts_nested_attributes_for :thing_skills #allow_destroy: true

    validates_uniqueness_of :title


end
