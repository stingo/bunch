class Event < ApplicationRecord

	has_many :thing_locations

	has_many :locations, through: :thing_locations
	



	belongs_to :profile

	mount_uploader :eventpic, EventpicUploader

end
