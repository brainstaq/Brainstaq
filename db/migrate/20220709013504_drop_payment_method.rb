class DropPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    drop_table :payment_methods
  end
end
