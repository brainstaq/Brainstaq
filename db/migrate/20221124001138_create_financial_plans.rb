class CreateFinancialPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
