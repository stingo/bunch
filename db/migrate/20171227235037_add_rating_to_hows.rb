class AddRatingToHows < ActiveRecord::Migration[5.1]
  def change
    add_column :hows, :rating, :integer
    add_column :hows, :ingredients, :text
    
    add_index :hows, :rating
    add_index :hows, :ingredients
  end
end
