class AddPortfolioToEnterprises < ActiveRecord::Migration[6.1]
  def change
    add_column :enterprises, :products, :text
    add_column :enterprises, :services, :text
    add_column :enterprises, :portfolio, :text
  end
end
