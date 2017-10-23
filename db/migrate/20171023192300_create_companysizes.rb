class CreateCompanysizes < ActiveRecord::Migration[5.1]
  def change
    create_table :companysizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
