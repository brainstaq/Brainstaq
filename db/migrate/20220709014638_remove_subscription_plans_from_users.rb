class RemoveSubscriptionPlansFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :subscription_plan_id, :bigint
    remove_index :users, :subscription_plan_id, if_exists:true
  end
end
