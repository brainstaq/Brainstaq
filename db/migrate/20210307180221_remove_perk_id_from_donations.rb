class RemovePerkIdFromDonations < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :perk_id, :integer
  end
end
