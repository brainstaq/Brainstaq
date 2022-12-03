class AddPriceDetailsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :decimal, precision: 8, scale: 2
    add_column :services, :cost, :decimal, precision: 8, scale: 2
  end
end
