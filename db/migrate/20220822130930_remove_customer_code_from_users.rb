class RemoveCustomerCodeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :customer_code, :integer, limit:8
  end
end
