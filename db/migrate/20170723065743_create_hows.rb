class CreateHows < ActiveRecord::Migration[5.1]
  def change
    create_table :hows do |t|
      t.string :name
      t.text :description
      t.string :howcover
      t.string :video
      t.datetime :duration
      t.text :recipetips
      t.string :slug
      t.string :subtitle
      t.string :subtitle1
      t.string :subtitle2
      t.string :subtitle3
      t.text :subbody1
      t.text :subbody2
      t.text :subbody3

      t.timestamps
    end
  end
end
