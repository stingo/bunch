class CreateThingSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :thing_skills do |t|
    	t.integer :job_id
        t.integer :skill_id
        t.integer :profile_id
    end
  end
end




