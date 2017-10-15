class AddAttributesToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :services, :text
    add_column :companies, :yearfounded, :datetime
    add_column :companies, :companyemail, :string
    add_column :companies, :contactphone, :integer
    add_column :companies, :video1, :string
    add_column :companies, :video2, :string
    add_column :companies, :facebookurl, :string
    add_column :companies, :twitterurl, :string
    add_column :companies, :linkedinurl, :string
    add_column :companies, :googleplusurl, :string
    add_column :companies, :pinteresturl, :string
    add_column :companies, :instagramurl, :string
  end
end
