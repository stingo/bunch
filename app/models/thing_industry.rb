class ThingIndustry < ActiveRecord::Base

belongs_to :job, optional: true

belongs_to :company, optional: true

belongs_to :industry

belongs_to :profile, optional: true



#has_one or belongs_to :profile, optional: true

end

