class CreateWorkingCapitals < ActiveRecord::Migration[6.1]
  def change
    create_table :working_capitals do |t|
      t.integer :receivable_days
      t.integer :payable_days
      t.integer :inventory_days
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
