class DropSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    drop_table :subscription_plans
  end
end
