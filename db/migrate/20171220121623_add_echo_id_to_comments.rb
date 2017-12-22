class AddEchoIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :echo_id, :integer
    add_index :comments, :echo_id
  end
end
