class CreateSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.string :duration
      t.text :features

      t.timestamps
    end
  end
end
