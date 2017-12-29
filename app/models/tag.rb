class Tag < ActiveRecord::Base

  #has_many :tags, through: :taggings
  #has_many :taggings, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

   acts_as_taggable

Echo.tag_counts_on(:tags).order('count desc').limit(1)
end
