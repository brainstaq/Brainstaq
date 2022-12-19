class ChangeTeamMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :team_members, :position_id, :integer
    remove_column :seasonal_estimates, :product_id, :integer
    remove_column :revenue_growth_rates, :base_product_price, :integer
    remove_column :revenue_growth_rates, :product_id, :integer
  end
end
