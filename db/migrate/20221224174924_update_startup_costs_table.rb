class UpdateStartupCostsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :startup_costs, force: :cascade

    add_column :business_plans, :land, :integer
    add_column :business_plans, :rent, :integer
    add_column :business_plans, :office_supplies, :integer
    add_column :business_plans, :equipment, :integer
    add_column :business_plans, :vehicles, :integer
    add_column :business_plans, :utilities, :integer
    add_column :business_plans, :opening_inventory, :integer
    add_column :business_plans, :capital, :integer
    add_column :business_plans, :contingency, :integer
  end
end
