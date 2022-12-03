class ChangeRevenueGrowthRate < ActiveRecord::Migration[6.1]
  def change
    remove_column :revenue_growth_rates, :year, :integer
    remove_column :revenue_growth_rates, :sales_volume_growth_rate, :integer
    remove_column :revenue_growth_rates, :unit_price_growth_rate, :integer
    add_column :revenue_growth_rates, :sales_volume_growth_rate_one, :integer
    add_column :revenue_growth_rates, :unit_price_growth_rate_one, :integer
    add_column :revenue_growth_rates, :sales_volume_growth_rate_two, :integer
    add_column :revenue_growth_rates, :unit_price_growth_rate_two, :integer
    add_column :revenue_growth_rates, :sales_volume_growth_rate_three, :integer
    add_column :revenue_growth_rates, :unit_price_growth_rate_three, :integer
    add_column :revenue_growth_rates, :sales_volume_growth_rate_four, :integer
    add_column :revenue_growth_rates, :unit_price_growth_rate_four, :integer
    add_column :revenue_growth_rates, :sales_volume_growth_rate_five, :integer
    add_column :revenue_growth_rates, :unit_price_growth_rate_five, :integer
  end
end
