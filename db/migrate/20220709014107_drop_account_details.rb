class DropAccountDetails < ActiveRecord::Migration[6.1]
  def change
    drop_table :account_details
  end
end
