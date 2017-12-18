class CreateEchocategories < ActiveRecord::Migration[5.1]
  def change
    create_table :echocategories do |t|
      t.string :name
      t.text :description
      t.string :echocatimage

      t.timestamps
    end
  end
end
