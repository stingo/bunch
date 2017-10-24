class CreateThingIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :thing_industries do |t|
    	t.integer :company_id
        t.integer :job_id
        t.integer :profile_id
    end
  end
end
