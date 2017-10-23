class Companytype < ApplicationRecord
	has_many :companies
	belongs_to :profiles, :optional => true

end
