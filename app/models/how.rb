class How < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"
    belongs_to :howcategory, :optional => true
	mount_uploader :howcover, HowcoverUploader

	is_impressionable

	#def to_param
    #{}"#{id} #{name}".parameterize
     #end

     extend FriendlyId
         friendly_id :name, use: :slugged

 

     def should_generate_new_friendly_id?
      name_changed?
     end

end
