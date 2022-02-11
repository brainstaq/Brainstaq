class AddSocialProfilesToEnterprises < ActiveRecord::Migration[6.1]
  def change
    add_column :enterprises, :facebook_url, :string
    add_column :enterprises, :twitter_url, :string
    add_column :enterprises, :instagram_url, :string
    add_column :enterprises, :website_url, :string
  end
end
