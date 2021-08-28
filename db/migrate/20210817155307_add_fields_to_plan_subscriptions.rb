class AddFieldsToPlanSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :plan_subscriptions, :channel, :string
    add_column :plan_subscriptions, :status, :string
    add_column :plan_subscriptions, :gateway_response, :string
    add_column :plan_subscriptions, :customer_code, :string
    add_column :plan_subscriptions, :currency, :string
    add_column :plan_subscriptions, :reference, :string
    add_column :plan_subscriptions, :amount, :integer, limit:8
  end
end
