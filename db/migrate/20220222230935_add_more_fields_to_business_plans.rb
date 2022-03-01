class AddMoreFieldsToBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :business_plans, :user_id, :integer
  end
end
