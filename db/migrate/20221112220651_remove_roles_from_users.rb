class RemoveRolesFromUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :courses_count, :integer, default: 0, null: false
    add_column :users, :enrollments_count, :integer, default: 0, null: false
    add_column :users, :comments_count, :integer, default: 0, null: false
    add_column :users, :user_lessons_count, :integer, default: 0, null: false
    add_column :users, :refresh_token, :string
    add_column :users, :expires_at, :integer
    add_column :users, :expires, :boolean
    add_column :users, :courses_income, :integer, default: 0, null: false
    add_column :users, :balance, :integer, default: 0, null: false
    add_column :users, :enrollments_expenses, :integer, default: 0, null: false
    remove_column :users, :role, :integer, default: 0
  end
end
