class AddIncomeToCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :level, :string
    remove_column :courses, :price, :decimal, precision: 8, scale: 2, default: "5.0"
    add_column :courses, :marketing_description, :text
    add_column :courses, :language, :string, default: "English", null: false
    add_column :courses, :average_rating, :float, default: 0.0, null: false
    add_column :courses, :enrollments_count, :integer, default: 0, null: false
    add_column :courses, :lessons_count, :integer, default: 0, null: false
    add_column :courses, :published, :boolean, default: false
    add_column :courses, :approved, :boolean, default: false
    add_column :courses, :income, :integer, default: 0, null: false
    add_index :courses, :slug, unique: true
    add_column :courses, :level, :string, default: "Beginner", null: false
    add_column :courses, :price, :integer, default: 0, null: false
  end
end
