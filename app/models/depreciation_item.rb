class DepreciationItem < ApplicationRecord
  belongs_to :financial_plan

  validates :item_name, presence: true
  validates :rate, presence: true
end
