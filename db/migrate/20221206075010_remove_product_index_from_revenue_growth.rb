class RemoveProductIndexFromRevenueGrowth < ActiveRecord::Migration[6.1]
  def change
    remove_index :revenue_growth_rates, :product, if_exists:true
  end
end
