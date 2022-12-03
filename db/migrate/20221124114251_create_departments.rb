class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :number_of_senior_employees
      t.integer :number_of_junior_employees

      t.references :financial_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
