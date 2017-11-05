class Skill < ApplicationRecord
	has_many :thing_skills
    has_many :profiles, through: :thing_skills

    has_many :jobs, through: :thing_skills

    accepts_nested_attributes_for :thing_skills #allow_destroy: true

    validates_uniqueness_of :title


        extend FriendlyId
         friendly_id :title, use: :slugged

 

     def should_generate_new_friendly_id?
      title_changed?
     end


end
