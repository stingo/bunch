class AddInstagramurlToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :instagram_url, :string
  end
end
