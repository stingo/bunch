class Echocategory < ApplicationRecord
	has_many :echos
	belongs_to :profile

	extend FriendlyId
         friendly_id :name, use: :slugged

 

     def should_generate_new_friendly_id?
      name_changed?
     end

     mount_uploader :echocatimage, EchocatimageUploader


     

end
