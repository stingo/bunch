class AddAdimagesToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :adimages, :json
  end
end
