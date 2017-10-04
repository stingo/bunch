class Company < ApplicationRecord
	has_many :thing_locations

	has_many :locations, through: :thing_locations
	



	belongs_to :profile

	validates :name, presence: true
end
