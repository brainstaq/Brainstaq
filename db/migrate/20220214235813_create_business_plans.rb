class CreateBusinessPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :business_plans do |t|
      t.text :executive_summary
      t.text :products_and_services
      t.text :industry_analysis
      t.text :competition
      t.text :swot
      t.text :operations
      t.text :marketing
      t.text :financial
      t.text :appendices
      t.text :milestones
      t.text :vision
      t.text :mision
      t.text :objectives
      t.text :valur_proposition
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
