class CreatePlanSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_subscriptions do |t|
      t.references :user
      t.string :plan
      t.datetime :active_until

      t.timestamps
    end
  end
end
