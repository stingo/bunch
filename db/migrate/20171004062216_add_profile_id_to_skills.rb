class AddProfileIdToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :profile_id, :integer
  end
end
