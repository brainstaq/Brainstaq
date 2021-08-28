class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscribed_to_plan, :boolean
    add_column :users, :plan_subscription_id, :string
    add_column :users, :plan, :string
  end
end
