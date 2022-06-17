class RemoveDetailsFromEnterprises < ActiveRecord::Migration[6.1]
  def change
    remove_column :enterprises, :products, :text
    remove_column :enterprises, :portfolio, :text
    remove_column :enterprises, :services, :text
    remove_column :enterprises, :team, :text
  end
end
