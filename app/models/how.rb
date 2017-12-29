class How < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"
    belongs_to :howcategory, :optional => true
	mount_uploader :howcover, HowcoverUploader

    acts_as_taggable

	is_impressionable

	#def to_param
    #{}"#{id} #{name}".parameterize
     #end

     extend FriendlyId
         friendly_id :title, use: :slugged

 

     def should_generate_new_friendly_id?
      title_changed?
     end

end
