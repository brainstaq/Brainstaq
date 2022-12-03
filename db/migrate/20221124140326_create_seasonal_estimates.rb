class CreateSeasonalEstimates < ActiveRecord::Migration[6.1]
  def change
    create_table :seasonal_estimates do |t|
      t.string :product
      t.string :month
      t.integer :sales_percentage
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
    add_index :seasonal_estimates, :product
  end
end
