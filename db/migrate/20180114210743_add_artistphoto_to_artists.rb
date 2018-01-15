class AddArtistphotoToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :artistphoto, :string
    add_column :artists, :artistprofilecover, :string
  end
end
