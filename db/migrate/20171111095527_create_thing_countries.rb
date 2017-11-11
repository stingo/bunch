class CreateThingCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :thing_countries do |t|
    	t.integer :company_id
    end
  end
end
