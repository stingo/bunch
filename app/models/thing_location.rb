class ThingLocation < ActiveRecord::Base

belongs_to :event, optional: true

belongs_to :location

belongs_to :profile, optional: true

belongs_to :job, optional: true

belongs_to :company, optional: true

#has_one or belongs_to :profile, optional: true

end

