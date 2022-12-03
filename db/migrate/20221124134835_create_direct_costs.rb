class CreateDirectCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :direct_costs do |t|
      t.string :item
      t.integer :cost
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
