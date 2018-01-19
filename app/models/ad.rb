class Ad < ApplicationRecord

	belongs_to :profile
    is_impressionable
    acts_as_taggable

    mount_uploaders :adimages, AdimagesUploader

    validates :name, length: { maximum: 100 }

    validates :name, presence: true
    validate :adimages_count_validation, :if => "adimages?"  

    def adimages_count_validation
      errors[:adimages] << "should be less than 5" if adimages.count > 4
    end
   
    extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
