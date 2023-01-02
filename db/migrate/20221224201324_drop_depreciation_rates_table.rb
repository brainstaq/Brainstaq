class DropDepreciationRatesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :depreciation_items, force: :cascade
    drop_table :costs_growth_rates, force: :cascade

    add_column :business_plans, :dep_building, :decimal
    add_column :business_plans, :dep_furniture, :decimal
    add_column :business_plans, :dep_machinery, :decimal
    add_column :business_plans, :dep_installations, :decimal
    add_column :business_plans, :dep_vehicles, :decimal

    add_column :business_plans, :rent_cgr1, :decimal
    add_column :business_plans, :direct_cgr1, :decimal
    add_column :business_plans, :salaries_cgr1, :decimal
    add_column :business_plans, :utilities_cgr1, :decimal
    add_column :business_plans, :marketing_cgr1, :decimal
    add_column :business_plans, :maintenance_cgr1, :decimal
    add_column :business_plans, :transport_cgr1, :decimal
    add_column :business_plans, :phone_cgr1, :decimal
    add_column :business_plans, :admin_cgr1, :decimal

    add_column :business_plans, :rent_cgr2, :decimal
    add_column :business_plans, :direct_cgr2, :decimal
    add_column :business_plans, :salaries_cgr2, :decimal
    add_column :business_plans, :utilities_cgr2, :decimal
    add_column :business_plans, :marketing_cgr2, :decimal
    add_column :business_plans, :maintenance_cgr2, :decimal
    add_column :business_plans, :transport_cgr2, :decimal
    add_column :business_plans, :phone_cgr2, :decimal
    add_column :business_plans, :admin_cgr2, :decimal

    add_column :business_plans, :rent_cgr3, :decimal
    add_column :business_plans, :direct_cgr3, :decimal
    add_column :business_plans, :salaries_cgr3, :decimal
    add_column :business_plans, :utilities_cgr3, :decimal
    add_column :business_plans, :marketing_cgr3, :decimal
    add_column :business_plans, :maintenance_cgr3, :decimal
    add_column :business_plans, :transport_cgr3, :decimal
    add_column :business_plans, :phone_cgr3, :decimal
    add_column :business_plans, :admin_cgr3, :decimal

    add_column :business_plans, :rent_cgr4, :decimal
    add_column :business_plans, :direct_cgr4, :decimal
    add_column :business_plans, :salaries_cgr4, :decimal
    add_column :business_plans, :utilities_cgr4, :decimal
    add_column :business_plans, :marketing_cgr4, :decimal
    add_column :business_plans, :maintenance_cgr4, :decimal
    add_column :business_plans, :transport_cgr4, :decimal
    add_column :business_plans, :phone_cgr4, :decimal
    add_column :business_plans, :admin_cgr4, :decimal

    add_column :business_plans, :rent_cgr5, :decimal
    add_column :business_plans, :direct_cgr5, :decimal
    add_column :business_plans, :salaries_cgr5, :decimal
    add_column :business_plans, :utilities_cgr5, :decimal
    add_column :business_plans, :marketing_cgr5, :decimal
    add_column :business_plans, :maintenance_cgr5, :decimal
    add_column :business_plans, :transport_cgr5, :decimal
    add_column :business_plans, :phone_cgr5, :decimal
    add_column :business_plans, :admin_cgr5, :decimal
  end
end
