class AddIndustryIdToThingIndustries < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_industries, :industry_id, :integer

    add_index :thing_industries, :industry_id
  end
end
