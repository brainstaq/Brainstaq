class DropCharge < ActiveRecord::Migration[6.1]
  def change
    drop_table :charges
  end
end
