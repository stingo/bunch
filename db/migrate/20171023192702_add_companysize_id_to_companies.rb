class AddCompanysizeIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :companysize_id, :integer

    add_index :companies, :companysize_id
  end
end
