class Industry < ApplicationRecord
	has_many :thing_industries

	has_many :companies, through: :thing_industries
	has_many :jobs, through: :thing_industries
	has_many :profiles, through: :thing_industries



	 accepts_nested_attributes_for :thing_industries #allow_destroy: true
end
