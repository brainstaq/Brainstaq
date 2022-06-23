class CreatePitchDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_decks do |t|
      t.text :elevator_pitch
      t.text :mission
      t.text :problem
      t.text :competitor_analysis
      t.text :solution
      t.text :how_it_works
      t.text :market_opportunity
      t.text :market_size
      t.text :financials
      t.text :revenue_model
      t.text :traction
      t.text :growth_strategy
      t.integer :user_id
      t.text :investment
      t.text :team
      t.text :introduction
      t.text :conclusion
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
