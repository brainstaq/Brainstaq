class AddMiscCgrToBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :business_plans, :misc_cgr1, :decimal
    add_column :business_plans, :misc_cgr2, :decimal
    add_column :business_plans, :misc_cgr3, :decimal
    add_column :business_plans, :misc_cgr4, :decimal
    add_column :business_plans, :misc_cgr5, :decimal
  end
end
