class AddEchocategoryIdToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :echocategory_id, :integer

    add_index :echos, :echocategory_id
  end
end
