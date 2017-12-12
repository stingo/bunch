class Echo < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"

	is_impressionable

	#def to_param
    #{}"#{id} #{name}".parameterize
     #end

     extend FriendlyId
         friendly_id :headline, use: :slugged

 

     def should_generate_new_friendly_id?
      headline_changed?
     end
end
