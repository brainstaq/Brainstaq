class ChangeSeasonalEstimates < ActiveRecord::Migration[6.1]
  def change
    remove_column :seasonal_estimates, :month, :string
    remove_column :seasonal_estimates, :sales_percentage, :integer
    add_column :seasonal_estimates, :sales_percentage_one, :integer
    add_column :seasonal_estimates, :sales_percentage_two, :integer
    add_column :seasonal_estimates, :sales_percentage_three, :integer
    add_column :seasonal_estimates, :sales_percentage_four, :integer
    add_column :seasonal_estimates, :sales_percentage_five, :integer
    add_column :seasonal_estimates, :sales_percentage_six, :integer
    add_column :seasonal_estimates, :sales_percentage_seven, :integer
    add_column :seasonal_estimates, :sales_percentage_eight, :integer
    add_column :seasonal_estimates, :sales_percentage_nine, :integer
    add_column :seasonal_estimates, :sales_percentage_ten, :integer
    add_column :seasonal_estimates, :sales_percentage_eleven, :integer
    add_column :seasonal_estimates, :sales_percentage_twelve, :integer
  end
end
