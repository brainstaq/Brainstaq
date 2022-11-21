class AddSlugToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_column :enrollments, :slug, :string
    add_index :enrollments, :slug, unique: true
    add_column :user_lessons, :impressions, :integer, default: 0, null: false
  end
end
