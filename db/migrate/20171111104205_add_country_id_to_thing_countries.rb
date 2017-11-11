class AddCountryIdToThingCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_countries, :country_id, :integer
    add_index :thing_countries, :country_id
  end
end
