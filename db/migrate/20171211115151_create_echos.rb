class CreateEchos < ActiveRecord::Migration[5.1]
  def change
    create_table :echos do |t|
      t.string :headline
      t.text :body
      t.string :image1
      t.string :videourl

      t.timestamps
    end
  end
end
