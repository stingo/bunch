class CreateUrbanterms < ActiveRecord::Migration[5.1]
  def change
    create_table :urbanterms do |t|
      t.string :title
      t.text :meaning1
      t.text :meaning2
      t.text :origin
      t.text :example1
      t.text :example2
      t.text :example3
      t.text :example4
      t.string :termcover
      t.string :termaudio

      t.timestamps
    end
  end
end
