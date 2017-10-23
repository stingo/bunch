class AddProfileIdToCompanytypes < ActiveRecord::Migration[5.1]
  def change
    add_column :companytypes, :profile_id, :integer
    add_index :companytypes, [:profile_id, :created_at]
  end
end
