class ModifyBusinessPlansTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :business_plans, :loan_end, :integer
  end
end
