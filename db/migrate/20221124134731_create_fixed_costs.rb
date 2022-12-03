class CreateFixedCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_costs do |t|
      t.string :item
      t.integer :cost
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
