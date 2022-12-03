class FinancialPlan < ApplicationRecord
  belongs_to :enterprise

  validates :company_tax_rate, :bank_interest_rate, :inflation_rate, :savings, 
  :grants, :equity, :debt, :enterprise_id, presence: true

  # validates :receivable_days, presence: true
  # validates :payable_days, presence: true
  # validates :inventory_days, presence: true

  has_many :depreciation_items, dependent: :destroy
  accepts_nested_attributes_for :depreciation_items, allow_destroy: true, reject_if: proc { |attr| attr['item_name'].blank? }

  has_many :costs_growth_rates, dependent: :destroy
  accepts_nested_attributes_for :costs_growth_rates, allow_destroy: true, reject_if: proc { |attr| attr['item_name'].blank? }

  has_many :debt_financings, dependent: :destroy
  accepts_nested_attributes_for :debt_financings, allow_destroy: true, reject_if: proc { |attr| attr['loan_amount'].blank? }

  has_many :direct_costs, dependent: :destroy
  accepts_nested_attributes_for :direct_costs, allow_destroy: true, reject_if: proc { |attr| attr['item'].blank? }

  has_many :fixed_costs, dependent: :destroy
  accepts_nested_attributes_for :fixed_costs, allow_destroy: true, reject_if: proc { |attr| attr['item'].blank? }

  has_many :positions, dependent: :destroy
  accepts_nested_attributes_for :positions, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }

  has_many :revenue_growth_rates, dependent: :destroy
  accepts_nested_attributes_for :revenue_growth_rates, allow_destroy: true, reject_if: proc { |attr| attr['product'].blank? }

  has_many :seasonal_estimates, dependent: :destroy
  accepts_nested_attributes_for :seasonal_estimates, allow_destroy: true

  has_many :startup_costs, dependent: :destroy
  accepts_nested_attributes_for :startup_costs, allow_destroy: true
end
