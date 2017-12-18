class AddContent2ToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :content2, :text

    add_index :echos, :content2
  end
end
