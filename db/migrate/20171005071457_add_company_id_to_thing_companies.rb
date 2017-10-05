class AddCompanyIdToThingCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_companies, :company_id, :integer
    add_column :thing_companies, :event_id, :integer

    add_index :thing_companies, :company_id
    add_index :thing_companies, :event_id
  end
end
