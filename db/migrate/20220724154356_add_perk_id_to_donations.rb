class AddPerkIdToDonations < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :perk_id, :integer
    add_column :donations, :user_id, :integer
    add_index :donations, :perk_id
    add_index :donations, :idea_id
    add_index :donations, :user_id
  end
end
