class CreateCostsGrowthRates < ActiveRecord::Migration[6.1]
  def change
    create_table :costs_growth_rates do |t|
      t.string :item_name
      t.integer :cost_growth_rate
      t.integer :year
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
