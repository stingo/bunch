class AddEventpicToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :eventpic, :string
  end
end
