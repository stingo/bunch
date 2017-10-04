class Location < ApplicationRecord
   has_many :thing_locations

    has_many :events, through: :thing_locations

    has_many :profiles, through: :thing_locations

    has_many :companies, through: :thing_locations

    has_many :jobs, through: :thing_locations

    accepts_nested_attributes_for :thing_locations #allow_destroy: true

    validates_uniqueness_of :name


    extend FriendlyId
         friendly_id :name, use: :slugged
end
