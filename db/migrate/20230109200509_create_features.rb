class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :subscription_plan_features do |t|
      t.references :subscription_plan, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
