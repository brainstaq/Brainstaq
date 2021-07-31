class CreateSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_plans do |t|
      t.references :user
      t.string :plan
      t.datetime :active_until

      t.timestamps
    end
  end
end
