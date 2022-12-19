class AddProductIndexToRevenueGrowth < ActiveRecord::Migration[6.1]
  def change
    add_index :revenue_growth_rates, :product
  end
end
