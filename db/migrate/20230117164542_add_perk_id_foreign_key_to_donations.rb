class AddPerkIdForeignKeyToDonations < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :donations, :perks, column: :perk_id
  end
end
