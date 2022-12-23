class DropDebtFinancingsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :debt_financings, force: :cascade

    add_column :business_plans, :loan_year, :integer
    add_column :business_plans, :loan_amount, :integer
    add_column :business_plans, :repayment_period, :integer
    add_column :business_plans, :loan_end, :integer
  end
end
