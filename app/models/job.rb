class Job < ApplicationRecord

    is_impressionable

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

    validates :title, presence: true
    validates :description, presence: true

    validates :company_id, presence: true, numericality: { only_integer: true }


 belongs_to :company, :optional => true
 belongs_to :jobtype, :optional => true



    

    accepts_nested_attributes_for :thing_locations #allow_destroy: true
    accepts_nested_attributes_for :thing_skills #allow_destroy: true
    accepts_nested_attributes_for :thing_companies #allow_destroy: true

    extend FriendlyId
         friendly_id :title, use: :slugged

 

     def should_generate_new_friendly_id?
      title_changed?
     end

end
