class AddManagementFieldToBusinessPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :business_plans, :management, :text
  end
end
