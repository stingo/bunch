class RenameNameToTitle < ActiveRecord::Migration[5.1]
  def change
  	rename_column :hows, :name, :title
  end
end
