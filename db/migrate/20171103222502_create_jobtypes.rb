class CreateJobtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :jobtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
