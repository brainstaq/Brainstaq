class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :number_of_senior_employees
      t.integer :number_of_junior_employees
      t.integer :base_annual_junior_salary
      t.integer :base_annual__senior_salary
      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
    drop_table :departments, force: :cascade
  end
end
