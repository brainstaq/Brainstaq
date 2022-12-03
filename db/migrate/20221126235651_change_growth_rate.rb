class ChangeGrowthRate < ActiveRecord::Migration[6.1]
  def change
    remove_column :costs_growth_rates, :year, :integer
    remove_column :costs_growth_rates, :cost_growth_rate, :integer
    add_column :costs_growth_rates, :cost_growth_rate_one, :integer, default: 0, null: false
    add_column :costs_growth_rates, :cost_growth_rate_two, :integer, default: 0, null: false
    add_column :costs_growth_rates, :cost_growth_rate_three, :integer, default: 0, null: false
    add_column :costs_growth_rates, :cost_growth_rate_four, :integer, default: 0, null: false
    add_column :costs_growth_rates, :cost_growth_rate_five, :integer, default: 0, null: false
  end
end
