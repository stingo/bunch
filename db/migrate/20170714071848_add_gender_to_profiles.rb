class AddGenderToProfiles < ActiveRecord::Migration[5.1]
  def change
  	add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :displayname, :string
    add_column :profiles, :date_of_birth, :datetime
    add_column :profiles, :is_female, :boolean, default: false
    add_column :profiles, :pesnavatar, :string
    add_column :profiles, :profilecover, :string
    add_column :profiles, :admin, :boolean, default: false
    add_column :profiles, :summary, :text
  end
end
