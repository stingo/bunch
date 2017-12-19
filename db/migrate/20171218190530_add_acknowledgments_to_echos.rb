class AddAcknowledgmentsToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :acknowledgments, :text
    add_column :echos, :references, :text
  end
end
