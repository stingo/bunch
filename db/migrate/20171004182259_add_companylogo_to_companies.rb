class AddCompanylogoToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :companylogo, :string
    add_column :companies, :companycover, :string
    add_column :companies, :slug, :string
    add_column :companies, :websiteurl, :string

    add_column :companies, :profile_id, :integer

    add_index :companies, [:profile_id, :created_at]

  end
end

