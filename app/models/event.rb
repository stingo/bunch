class Event < ApplicationRecord

	has_many :thing_locations

	has_many :locations, through: :thing_locations
	accepts_nested_attributes_for :thing_locations #allow_destroy: true



	belongs_to :profile, foreign_key:"profile_id"

	mount_uploader :eventpic, EventpicUploader

end
