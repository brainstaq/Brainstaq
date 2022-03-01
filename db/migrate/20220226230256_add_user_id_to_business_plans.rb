class AddUserIdToBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    add_index :business_plans, :user_id
  end
end
