class AddSocialProfilesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :instagram_url, :string
    add_column :users, :linkedin_url, :string
  end
end
