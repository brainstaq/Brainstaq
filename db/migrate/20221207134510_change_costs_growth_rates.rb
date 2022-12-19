class ChangeCostsGrowthRates < ActiveRecord::Migration[6.1]
  def change
    remove_column :costs_growth_rates, :item_name, :string
    add_column :costs_growth_rates, :cost_item_id, :integer
  end
end
