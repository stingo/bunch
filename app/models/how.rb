class How < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"
	mount_uploader :howcover, HowcoverUploader

	is_impressionable

	#def to_param
    #{}"#{id} #{name}".parameterize
     #end

     extend FriendlyId
         friendly_id :name, use: :slugged

end
