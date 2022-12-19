class PitchDeck < ApplicationRecord
  validates :elevator_pitch, :mission, :problem, :competitor_analysis, :solution, 
  :how_it_works, :market_opportunity, :market_size, :financials, :revenue_model, 
  :traction, :growth_strategy, :investment, :team, :introduction, 
  :conclusion, presence: true

  # before_save :check_quota
  validates_uniqueness_of :enterprise_id

  belongs_to :enterprise

  private
  
  # def check_quota
  #   if self.enterprise.pitch_decks.count >= 1
  #     self.errors.add(:base, "Maximum number of Pitch Decks reached!")
  #     return false
  #   end
  # end
end
