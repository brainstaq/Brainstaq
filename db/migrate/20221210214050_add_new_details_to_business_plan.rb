class AddNewDetailsToBusinessPlan < ActiveRecord::Migration[6.1]
  def change
    remove_column :costs_growth_rates, :cost_item_id, :integer
    remove_index :costs_growth_rates, :financial_plan_id
    remove_column :costs_growth_rates, :financial_plan_id, :bigint, null: false
    # add_index :costs_growth_rates, :business_plan
    # add_column :costs_growth_rates, :business_plan_id, :bigint, null: false

    add_column :business_plans, :company_tax_rate, :decimal, precision: 8, scale: 2
    add_column :business_plans, :bank_interest_rate, :decimal, precision: 8, scale: 2
    add_column :business_plans, :inflation_rate, :integer
    add_column :business_plans, :salary_benefits, :integer
    add_column :business_plans, :receivable_days, :integer
    add_column :business_plans, :payable_days, :integer
    add_column :business_plans, :inventory_days, :integer
    add_column :business_plans, :savings, :integer
    add_column :business_plans, :grants, :integer
    add_column :business_plans, :equity, :integer
    add_column :business_plans, :debt, :integer
    add_column :business_plans, :equity_injection_one, :integer
    add_column :business_plans, :equity_injection_two, :integer
    add_column :business_plans, :equity_injection_three, :integer
    add_column :business_plans, :equity_injection_four, :integer
  end
end
