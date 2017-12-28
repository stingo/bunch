class RenameRecipetipsToHintsAndTips < ActiveRecord::Migration[5.1]
  def change

  	rename_column :hows, :recipetips, :hints_and_tips
  end
end
