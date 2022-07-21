class DropSubscriptionPlanFeatures < ActiveRecord::Migration[6.1]
  def change
    drop_table :subscription_plan_features
  end
end
