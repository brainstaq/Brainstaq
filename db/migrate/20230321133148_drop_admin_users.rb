class DropAdminUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :admin_users, force: :cascade
  end
end
