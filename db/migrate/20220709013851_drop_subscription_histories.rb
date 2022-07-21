class DropSubscriptionHistories < ActiveRecord::Migration[6.1]
  def change
    drop_table :subscription_histories
  end
end
