class Genre < ApplicationRecord
	is_impressionable
	belongs_to :profile
	has_many :songs
	has_many :artists

	extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
