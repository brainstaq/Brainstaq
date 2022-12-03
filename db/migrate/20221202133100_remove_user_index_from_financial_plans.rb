class RemoveUserIndexFromFinancialPlans < ActiveRecord::Migration[6.1]
  def change
    remove_index :financial_plans, :user_id, if_exists:true
  end
end
