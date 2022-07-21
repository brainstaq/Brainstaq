class RemoveSubscriptionIndexFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :customer_code, :bigint
    remove_column :users, :paystack_subscription_code, :string
    remove_column :users, :paystack_email_token, :string
    remove_column :users, :paystack_auth_code, :string
    remove_column :users, :paystack_cust_code, :string
    remove_reference :users, :payment_method, index: true, foreign_key: true
    remove_index :users, :phone
  end
end
