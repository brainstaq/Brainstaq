class SeasonalEstimate < ApplicationRecord
  belongs_to :financial_plan

  validates :product, presence: true
  validates :sales_percentage_one, presence: true
  validates :sales_percentage_two, presence: true
  validates :sales_percentage_three, presence: true
  validates :sales_percentage_four, presence: true
  validates :sales_percentage_five, presence: true
  validates :sales_percentage_six, presence: true
  validates :sales_percentage_seven, presence: true
  validates :sales_percentage_eight, presence: true
  validates :sales_percentage_nine, presence: true
  validates :sales_percentage_ten, presence: true
  validates :sales_percentage_eleven, presence: true
  validates :sales_percentage_twelve, presence: true
end
