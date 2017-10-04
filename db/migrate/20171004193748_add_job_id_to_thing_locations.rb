class AddJobIdToThingLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_locations, :job_id, :integer
    add_column :thing_locations, :company_id, :integer

    

  end
end




