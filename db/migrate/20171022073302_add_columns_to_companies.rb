class AddColumnsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :companytype_id, :integer
    add_index :companies, :companytype_id
  end
end

