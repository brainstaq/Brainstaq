class BusinessPlan < ApplicationRecord
  validates :executive_summary, :products_and_services, :industry_analysis, :competition, 
  :swot, :operations, :enterprise_id, :marketing, :financial, :management, :appendices, 
  :vision, :mission, :objectives, :value_proposition, :company_tax_rate, :bank_interest_rate,
  :inflation_rate, presence: true

  # before_save :check_quota
  # validates_uniqueness_of :enterprise_id

  belongs_to :enterprise

  has_many :depreciation_items, dependent: :destroy
  has_many :costs_growth_rates, dependent: :destroy
  has_many :products_and_growth_rates, dependent: :destroy
  has_many :fixed_costs, dependent: :destroy
  has_many :debt_financings, dependent: :destroy
  has_many :direct_costs, dependent: :destroy
  has_many :startup_costs, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :marketing_expenses, dependent: :destroy
  has_many :milestones, dependent: :destroy
  has_many :swots, dependent: :destroy

  accepts_nested_attributes_for :swots, allow_destroy: true
  accepts_nested_attributes_for :milestones, allow_destroy: true
  accepts_nested_attributes_for :marketing_expenses, allow_destroy: true
  accepts_nested_attributes_for :team_members, allow_destroy: true
  accepts_nested_attributes_for :depreciation_items, allow_destroy: true
  accepts_nested_attributes_for :costs_growth_rates, allow_destroy: true
  accepts_nested_attributes_for :debt_financings, allow_destroy: true
  accepts_nested_attributes_for :direct_costs, allow_destroy: true
  accepts_nested_attributes_for :fixed_costs, allow_destroy: true
  accepts_nested_attributes_for :positions, allow_destroy: true
  accepts_nested_attributes_for :products_and_growth_rates, allow_destroy: true
  accepts_nested_attributes_for :startup_costs, allow_destroy: true


  # private

  # def check_quota
  #   if self.enterprise.business_plans.count >= 1
  #     self.errors.add(:base, "Maximum number of Business Plans reached!")
  #     return false
  #   end
  # end

end
