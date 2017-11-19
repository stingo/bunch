class Urbanterm < ApplicationRecord
	acts_as_taggable


	is_impressionable

	
	
	belongs_to :profile, foreign_key:"profile_id"

	acts_as_votable

	mount_uploader :termcover, TermcoverUploader
	mount_uploader :termaudio, TermaudioUploader



  validates :meaning1, presence: { message: "Give at least one meaning to this term" }



end
