class AddAttributesToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :main_responsibilities, :string
    add_column :jobs, :main_requirements, :string
    add_column :jobs, :your_name, :string
    add_column :jobs, :phone, :string
  end
end

