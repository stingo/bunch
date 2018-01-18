class AddAttributesToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :website_link, :string
    add_column :ads, :youtube_video_link, :string
    add_column :ads, :ad_details, :text
  end
end
