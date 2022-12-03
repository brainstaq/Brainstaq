class StartupCost < ApplicationRecord
  belongs_to :financial_plan

  validates :item_name, presence: true
  validates :baseline_cost, presence: true
end
