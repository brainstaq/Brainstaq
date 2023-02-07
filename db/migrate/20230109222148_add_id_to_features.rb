class AddIdToFeatures < ActiveRecord::Migration[6.1]
  def change
    drop_table :features, force: :cascade
    drop_table :subscription_plan_features, force: :cascade

    create_table :features do |t|
      t.string :name
      t.string :description
      t.references :subscription_plan, foreign_key: true

      t.timestamps
    end
  end
end
