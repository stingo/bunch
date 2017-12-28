class RenameDurationToMinutes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :hows, :duration, :minutes
  	add_column :hows, :hours, :datetime
  	add_column :hows, :days, :datetime

  	add_index :hows, :hours
  	add_index :hows, :days
  end
end
