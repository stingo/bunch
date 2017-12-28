class RenameSubbody3ToReferences < ActiveRecord::Migration[5.1]
  def change
  	rename_column :hows, :subbody3, :references
  end
end
