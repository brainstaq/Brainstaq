class UpdatePositionsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :salary_benefits, :decimal
    add_column :positions, :salaries_cgr1, :decimal
    add_column :positions, :salaries_cgr2, :decimal
    add_column :positions, :salaries_cgr3, :decimal
    add_column :positions, :salaries_cgr4, :decimal
    add_column :positions, :salaries_cgr5, :decimal

    remove_column :business_plans, :salary_benefits, :integer
    remove_column :business_plans, :salaries_cgr1, :decimal
    remove_column :business_plans, :salaries_cgr2, :decimal
    remove_column :business_plans, :salaries_cgr3, :decimal
    remove_column :business_plans, :salaries_cgr4, :decimal
    remove_column :business_plans, :salaries_cgr5, :decimal
  end
end
