class DropProductsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :costs_growth_rates, force: :cascade
    drop_table :debt_financings, force: :cascade
    drop_table :depreciation_items, force: :cascade
    drop_table :direct_costs, force: :cascade
    drop_table :fixed_costs, force: :cascade
    drop_table :positions, force: :cascade
    drop_table :products, force: :cascade
    drop_table :revenue_growth_rates, force: :cascade
    drop_table :seasonal_estimates, force: :cascade
    drop_table :services, force: :cascade
    drop_table :startup_costs, force: :cascade
    drop_table :team_members, force: :cascade

    create_table :costs_growth_rates do |t|
      t.integer :cost_growth_rate_one, default: 0, null: false
      t.integer :cost_growth_rate_two, default: 0, null: false
      t.integer :cost_growth_rate_three, default: 0, null: false
      t.integer :cost_growth_rate_four, default: 0, null: false
      t.integer :cost_growth_rate_five, default: 0, null: false
      t.string :cost_item
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :debt_financings do |t|
      t.integer :loan_year
      t.integer :loan_amount
      t.integer :repayment_period
      t.integer :loan_end
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :depreciation_items do |t|
      t.string :item_name
      t.decimal :rate
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :direct_costs do |t|
      t.string :item
      t.integer :cost
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :fixed_costs do |t|
      t.string :item
      t.integer :cost
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :positions do |t|
      t.string :title
      t.integer :number_of_employees_one
      t.integer :number_of_employees_two
      t.integer :number_of_employees_three
      t.integer :base_annual_salary
      t.integer :number_of_employees_four
      t.integer :number_of_employees_five
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :revenue_growth_rates do |t|
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
      t.bigint :product_id
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :seasonal_estimates do |t|
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
      t.integer :product_id
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :cost
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :startup_costs do |t|
      t.string :item_name
      t.integer :baseline_cost
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    create_table :team_members do |t|
      t.string :full_name
      t.integer :position_id
      t.string :image
      t.text :bio
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
