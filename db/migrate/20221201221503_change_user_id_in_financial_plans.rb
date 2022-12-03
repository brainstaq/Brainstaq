class ChangeUserIdInFinancialPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :financial_plans, :user_id, :bigint, :null => false
    add_column :financial_plans, :user_id, :integer
    add_index :financial_plans, :user_id
  end
end
