class ThingLocation < ActiveRecord::Base

belongs_to :event, optional: true

belongs_to :location

belongs_to :profile, optional: true

end

