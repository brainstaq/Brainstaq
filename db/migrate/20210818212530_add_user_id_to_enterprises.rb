class AddUserIdToEnterprises < ActiveRecord::Migration[6.1]
  def change
    add_column :enterprises, :user_id, :integer
  end
end
