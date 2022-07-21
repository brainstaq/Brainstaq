class AddPaystackCustCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :customer_code, :integer, limit:8
    add_column :users, :paystack_email_token, :string
    add_column :users, :paystack_auth_code, :string
    add_column :users, :paystack_cust_code, :string
    add_index :users, :customer_code, unique: true
  end
end
