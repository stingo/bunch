class AddListingimagesToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :listingimages, :json
    add_column :listings, :slug, :string


    add_index :listings, :slug
  end
end
