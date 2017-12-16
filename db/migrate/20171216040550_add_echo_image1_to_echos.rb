class AddEchoImage1ToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :echoimage1, :string
    add_column :echos, :echoimage2, :string

    add_index :echos, :echoimage1
    add_index :echos, :echoimage2
  end
end
