class RemoveIndexFromBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :business_plans, :user_id, :integer
    remove_index :business_plans, :user_id, if_exists:true
    rename_column :business_plans, :mision, :mission
    rename_column :business_plans, :valur_proposition, :value_proposition
  end
end
