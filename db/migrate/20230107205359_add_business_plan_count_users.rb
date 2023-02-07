class AddBusinessPlanCountUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :enterprise_count, :integer, default: 0
    add_column :users, :business_plan_count, :integer, default: 0
  end
end
