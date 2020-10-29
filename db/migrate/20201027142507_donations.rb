class Donations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :donor_id, null: false
      t.integer :idea_id, null: false
      t.integer  :perk_id, null: false
      t.float :amount, null: false

      t.timestamps null: false
    end
  end
end
