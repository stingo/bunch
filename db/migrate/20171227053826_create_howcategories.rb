class CreateHowcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :howcategories do |t|
      t.string :name
      t.text :description
      t.text :slug

      t.timestamps
    end
  end
end
