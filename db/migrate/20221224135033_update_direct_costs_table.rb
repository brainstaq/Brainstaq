class UpdateDirectCostsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :direct_costs, force: :cascade
    drop_table :fixed_costs, force: :cascade

    add_column :business_plans, :raw_material_cost, :integer
    add_column :business_plans, :direct_labour_cost, :integer
    add_column :business_plans, :factory_overhead, :integer
    add_column :business_plans, :inbound_transport, :integer

    add_column :business_plans, :salaries_cost, :integer
    add_column :business_plans, :rent_cost, :integer
    add_column :business_plans, :utilities_cost, :integer
    add_column :business_plans, :marketing_cost, :integer
    add_column :business_plans, :admin_cost, :integer
    add_column :business_plans, :website_cost, :integer
    add_column :business_plans, :telephone_cost, :integer
    add_column :business_plans, :transport_cost, :integer
    add_column :business_plans, :misc, :integer
  end
end
