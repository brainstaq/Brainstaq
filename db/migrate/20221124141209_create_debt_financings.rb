class CreateDebtFinancings < ActiveRecord::Migration[6.1]
  def change
    create_table :debt_financings do |t|
      t.integer :loan_year
      t.integer :loan_amount
      t.integer :repayment_period
      t.integer :loan_end
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
