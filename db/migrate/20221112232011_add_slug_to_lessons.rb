class AddSlugToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :slug, :string
    add_index :lessons, :slug, unique: true
    add_column :lessons, :row_order, :integer
    add_column :lessons, :comments_count, :integer, null: false, default: 0
    add_column :lessons, :user_lessons_count, :integer, null: false, default: 0
  end
end
