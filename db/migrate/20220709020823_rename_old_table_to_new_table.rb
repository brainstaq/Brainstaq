class RenameOldTableToNewTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :plan_subscriptions, :transactions
  end
end
