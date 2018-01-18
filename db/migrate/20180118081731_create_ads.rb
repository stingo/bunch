class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :slug

      t.timestamps
    end
  end
end
