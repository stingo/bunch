class AddMinSalaryToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :min_salary, :integer
    add_column :jobs, :max_salary, :integer

    add_index :jobs, :min_salary
    add_index :jobs, :max_salary
  end
end
