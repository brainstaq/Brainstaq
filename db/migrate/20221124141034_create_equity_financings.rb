class CreateEquityFinancings < ActiveRecord::Migration[6.1]
  def change
    create_table :equity_financings do |t|
      t.integer :equity_injection
      t.integer :year
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
