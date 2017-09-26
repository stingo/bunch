class Event < ApplicationRecord

	has_many :thing_locations

	has_many :locations, through: :thing_locations
	



	belongs_to :profile

	mount_uploader :eventpic, EventpicUploader

	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

	after_update :crop_eventpic
  
  def crop_eventpic
    eventpic.recreate_versions! if crop_x.present?
  end


end
