class AddJobtypIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :jobtype_id, :integer

    add_index :jobs, :jobtype_id
  end
end
