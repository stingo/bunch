class How < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"
	mount_uploader :howcover, HowcoverUploader

	is_impressionable
end
