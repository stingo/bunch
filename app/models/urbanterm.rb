class Urbanterm < ApplicationRecord
	is_impressionable
	
	belongs_to :profile, foreign_key:"profile_id"

	extend FriendlyId
  friendly_id :title, use: :slugged

end
