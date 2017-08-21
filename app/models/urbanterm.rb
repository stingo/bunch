class Urbanterm < ApplicationRecord
	is_impressionable

	acts_as_taggable
	
	belongs_to :profile, foreign_key:"profile_id"

	acts_as_votable

extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  validates :meaning1, presence: { message: "Give at least one meaning to this term" }



end
