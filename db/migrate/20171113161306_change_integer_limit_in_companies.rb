class ChangeIntegerLimitInCompanies < ActiveRecord::Migration[5.1]
def change
     change_column :companies, :contactphone, :integer, limit: 8
   end
end

