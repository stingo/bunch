class Event < ApplicationRecord
	has_many :thing_locations

	has_many :locations, through: :thing_locations

	mount_uploader :eventpic, EventpicUploader

end
