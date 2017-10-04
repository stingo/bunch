class ThingSkill < ActiveRecord::Base

belongs_to :job, optional: true

belongs_to :skill

belongs_to :profile, optional: true

#has_one or belongs_to :profile, optional: true

end

