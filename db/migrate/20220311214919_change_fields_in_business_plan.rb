class ChangeFieldsInBusinessPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :business_plans, :user_id, :integer
    change_column :business_plans, :enterprise_id, :integer
  end
end
