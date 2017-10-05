class CreateThingCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :thing_companies do |t|
    	t.integer :job_id
        t.integer :profile_id
    end
  end
end
