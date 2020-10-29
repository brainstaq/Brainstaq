class FixCategoryInIdeas < ActiveRecord::Migration[6.0]
  def change
    remove_column :ideas, :category, :string
    add_column :ideas, :category_id, :integer
  end
end
