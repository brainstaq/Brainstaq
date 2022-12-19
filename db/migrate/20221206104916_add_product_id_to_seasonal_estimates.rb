class AddProductIdToSeasonalEstimates < ActiveRecord::Migration[6.1]
  def change
    remove_column :seasonal_estimates, :product, :string
    remove_index :seasonal_estimates, :product, if_exists:true
    add_column :seasonal_estimates, :product_id, :integer
  end
end
