class AddMoreDetailsToFinancialPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :financial_plans, :company_tax_rate, :decimal, precision: 8, scale: 2
    add_column :financial_plans, :bank_interest_rate, :decimal, precision: 8, scale: 2
    add_column :financial_plans, :inflation_rate, :integer
    add_column :financial_plans, :salary_benefits, :integer
  end
end
