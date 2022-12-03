class CreateDepreciationItems < ActiveRecord::Migration[6.1]
  def change
    create_table :depreciation_items do |t|
      t.string :item_name
      t.decimal :rate
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end

    create_table :startup_costs do |t|
      t.string :item_name
      t.integer :baseline_cost
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
    
end
