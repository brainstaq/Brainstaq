class AddProductIdToRevenueGrowth < ActiveRecord::Migration[6.1]
  def change
    remove_column :revenue_growth_rates, :product, :string
    add_column :revenue_growth_rates, :product_id, :integer
  end
end
