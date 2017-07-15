class Location < ApplicationRecord
   has_many :thing_locations

    has_many :events, through: :thing_locations

    validates_uniqueness_of :name
end
