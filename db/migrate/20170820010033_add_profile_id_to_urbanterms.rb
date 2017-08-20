class AddProfileIdToUrbanterms < ActiveRecord::Migration[5.1]
  def change
    add_column :urbanterms, :profile_id, :integer
    add_column :urbanterms, :slug, :string

    add_index :urbanterms, [:profile_id, :created_at]
    add_index :urbanterms, :slug


   
  end
end
