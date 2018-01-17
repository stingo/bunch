class AddAttributesToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :telephone, :string
    add_column :artists, :email, :string
    add_column :artists, :facebook_url, :string
    add_column :artists, :twitter_url, :string
    add_column :artists, :googleplus_url, :string
    add_column :artists, :pinterest_url, :string
    add_column :artists, :youtube_chanel_url, :string
    add_column :artists, :linkedin_url, :string
    add_column :artists, :genre_id, :integer
    add_column :artists, :photos, :json
  end
end
