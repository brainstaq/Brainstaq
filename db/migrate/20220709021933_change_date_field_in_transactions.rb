class ChangeDateFieldInTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :active_until, :datetime
    add_column :transactions, :expires_on, :date
    remove_column :transactions, :plan, :string
    add_column :transactions, :integer, :integer, limit:8
  end
end
