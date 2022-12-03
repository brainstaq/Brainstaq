class ChangePositions < ActiveRecord::Migration[6.1]
  def change
    remove_column :positions, :number_of_senior_employees, :integer
    remove_column :positions, :number_of_junior_employees, :integer
    remove_column :positions, :base_annual_junior_salary, :integer
    remove_column :positions, :base_annual__senior_salary, :integer
    add_column :positions, :number_of_employees_one, :integer
    add_column :positions, :number_of_employees_two, :integer
    add_column :positions, :number_of_employees_three, :integer
    add_column :positions, :base_annual_salary, :integer
    add_column :positions, :number_of_employees_four, :integer
    add_column :positions, :number_of_employees_five, :integer
  end
end