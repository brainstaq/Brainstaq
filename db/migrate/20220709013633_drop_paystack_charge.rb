class DropPaystackCharge < ActiveRecord::Migration[6.1]
  def change
    drop_table :paystack_charges
  end
end
