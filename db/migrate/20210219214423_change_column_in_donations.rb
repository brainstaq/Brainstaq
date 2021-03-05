class ChangeColumnInDonations < ActiveRecord::Migration[6.0]
  def change
    change_column :donations, :idea_id, :integer, null: false
  end
end
