class AddDetailsToSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscription_plans, :name, :string
    remove_column :subscription_plans, :price, :decimal
    remove_column :subscription_plans, :features, :text
    
    add_column :subscription_plans, :plan_name, :string
    add_column :subscription_plans, :cost, :integer
    add_column :subscription_plans, :description, :string
    add_column :subscription_plans, :recurring, :boolean
    add_column :subscription_plans, :paystack_plan_code, :string
    add_column :subscription_plans, :status, :integer, default: 0
    add_index :subscription_plans, :paystack_plan_code
  end
end
