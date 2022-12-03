class AddStartupFinancingToFinancialPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :financial_plans, :savings, :integer
    add_column :financial_plans, :grants, :integer
    add_column :financial_plans, :equity, :integer
    add_column :financial_plans, :debt, :integer
    add_column :financial_plans, :equity_injection_one, :integer
    add_column :financial_plans, :equity_injection_two, :integer
    add_column :financial_plans, :equity_injection_three, :integer
    add_column :financial_plans, :equity_injection_four, :integer


    drop_table :equity_financings, force: :cascade
    drop_table :startup_financings, force: :cascade
  end
end
