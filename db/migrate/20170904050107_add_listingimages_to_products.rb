class AddListingimagesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :listingimages, :json

 
  end
end


