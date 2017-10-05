class AddListingIdToThingCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_companies, :listing_id, :integer
    add_index :thing_companies, :listing_id
  end
end
