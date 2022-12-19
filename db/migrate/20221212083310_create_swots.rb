class CreateSwots < ActiveRecord::Migration[6.1]
  def change
    create_table :swots do |t|
      t.string :swot_type
      t.text :description
      t.references :business_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
