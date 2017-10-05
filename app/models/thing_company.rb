class ThingCompany < ActiveRecord::Base

belongs_to :job, optional: true

belongs_to :company

belongs_to :profile, optional: true

belongs_to :listing, optional: true

#has_one or belongs_to :profile, optional: true

end

