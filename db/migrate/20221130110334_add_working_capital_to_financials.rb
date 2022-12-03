class AddWorkingCapitalToFinancials < ActiveRecord::Migration[6.1]
  def change
    add_column :financial_plans, :receivable_days, :integer
    add_column :financial_plans, :payable_days, :integer
    add_column :financial_plans, :inventory_days, :integer
  end
end
