class AddMoreDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status, :integer
    add_column :users, :interval, :string
  end
end
