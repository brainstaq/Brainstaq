class CreateRevenueGrowthRates < ActiveRecord::Migration[6.1]
  def change
    create_table :revenue_growth_rates do |t|
      t.string :product
      t.integer :sales_volume_growth_rate
      t.integer :unit_price_growth_rate
      t.integer :base_product_price
      t.integer :monthly_sales_volume
      t.integer :year
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
