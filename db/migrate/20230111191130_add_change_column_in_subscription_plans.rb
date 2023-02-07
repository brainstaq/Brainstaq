class AddChangeColumnInSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscription_plans, :duration, :string
    add_column :subscription_plans, :duration, :integer
    add_column :users, :paystack_subscription_code, :string
    add_column :users, :customer_code, :bigint
    add_index :users, :customer_code, unique: true
    add_reference :users, :subscription_plan, index: true, foreign_key: true
  end
end
