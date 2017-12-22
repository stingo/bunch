class AddRatingToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :rating, :integer
    add_index :echos, :rating
  end
end
