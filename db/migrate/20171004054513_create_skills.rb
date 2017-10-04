class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
