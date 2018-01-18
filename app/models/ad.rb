class Ad < ApplicationRecord

	belongs_to :profile
    is_impressionable
    acts_as_taggable

    validates :name, presence: true
   
    extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
