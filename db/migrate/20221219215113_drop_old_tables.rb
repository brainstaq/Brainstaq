class DropOldTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :products, force: :cascade
    drop_table :revenue_growth_rates, force: :cascade
    drop_table :seasonal_estimates, force: :cascade

    create_table :products_and_growth_rates do |t|
      t.string :product_name
      t.text :description
      t.string :product_image
      t.integer :base_product_price
      t.integer :monthly_sales_volume
      t.integer :sales_volume_growth_rate_one
      t.integer :unit_price_growth_rate_one
      t.integer :sales_volume_growth_rate_two
      t.integer :unit_price_growth_rate_two
      t.integer :sales_volume_growth_rate_three
      t.integer :unit_price_growth_rate_three
      t.integer :sales_volume_growth_rate_four
      t.integer :unit_price_growth_rate_four
      t.integer :sales_volume_growth_rate_five
      t.integer :unit_price_growth_rate_five
      t.integer :sales_percentage_one
      t.integer :sales_percentage_two
      t.integer :sales_percentage_three
      t.integer :sales_percentage_four
      t.integer :sales_percentage_five
      t.integer :sales_percentage_six
      t.integer :sales_percentage_seven
      t.integer :sales_percentage_eight
      t.integer :sales_percentage_nine
      t.integer :sales_percentage_ten
      t.integer :sales_percentage_eleven
      t.integer :sales_percentage_twelve
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
