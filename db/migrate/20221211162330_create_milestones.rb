class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.string :milestone
      t.string :done_by
      t.integer :cost
      t.date :date_schedule
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
  
    create_table :marketing_expenses do |t|
      t.string :item_name
      t.integer :cost
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
    add_column :costs_growth_rates, :cost_item, :string
    drop_table :cost_items, force: :cascade
  end
end
