class RemoveLoanAmountFromBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :business_plans, :loan_amount, :integer
  end
end
