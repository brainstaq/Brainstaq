class RemoveEnterpriseCategoryFromEnterprises < ActiveRecord::Migration[6.1]
  def change
    remove_column :enterprises, :enterprise_category, :string
    add_column :enterprises, :category_id, :integer
  end
end
