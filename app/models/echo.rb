class Echo < ApplicationRecord
	belongs_to :profile, foreign_key:"profile_id"
	belongs_to :echocategory, :optional => true

	validates :headline, presence: true
	validates :body, presence: true
	validates :echocategory, presence: true
  

	is_impressionable

	acts_as_votable

	acts_as_taggable


     acts_as_commentable

	#def to_param
    #{}"#{id} #{name}".parameterize
     #end

     extend FriendlyId
         friendly_id :headline, use: :slugged

 

     def should_generate_new_friendly_id?
      headline_changed?
     end

    mount_uploader :echoimage1, EchoImage1Uploader
	mount_uploader :echoimage2, EchoImage2Uploader
	
	  def taglimit

  	ActsAsTaggableOn::Tag.most_used(1)
  	
  end

end
