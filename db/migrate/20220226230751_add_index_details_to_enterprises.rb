class AddIndexDetailsToEnterprises < ActiveRecord::Migration[6.1]
  def change
    add_index :enterprises, :user_id
  end
end
