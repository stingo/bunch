class AddCompanysizeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :companysize, :string
    

    add_index :companies, :companysize
  end
end
