class PitchDeck < ApplicationRecord
  validates :elevator_pitch, :mission, :problem, :competitor_analysis, :solution, 
  :how_it_works, :market_opportunity, :market_size, :financials, :revenue_model, 
  :traction, :growth_strategy, :investment, :team, :introduction, 
  :conclusion, presence: true

  belongs_to :enterprise
end
