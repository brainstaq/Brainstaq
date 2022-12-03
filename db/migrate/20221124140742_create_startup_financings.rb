class CreateStartupFinancings < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_financings do |t|
      t.integer :savings
      t.integer :grants
      t.integer :equity
      t.integer :debt
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
