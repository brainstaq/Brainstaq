class ChangeColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :courses_income, :integer, default: 0, null: false
    remove_column :users, :enrollments_expenses, :integer, default: 0, null: false
    add_column :users, :course_income, :integer, default: 0, null: false
    add_column :users, :enrollment_expenses, :integer, default: 0, null: false
  end
end
