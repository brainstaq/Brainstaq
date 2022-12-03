class BusinessPlan < ApplicationRecord
  validates :executive_summary, :products_and_services, :industry_analysis, :competition, 
  :swot, :operations, :enterprise_id, :marketing, :financial, :management, :appendices, 
  :milestones, :vision, :mission, :objectives, :value_proposition, presence: true

  before_save :check_quota
  validates_uniqueness_of :enterprise_id

  belongs_to :enterprise
  belongs_to :user

  private

  def check_quota
    if self.enterprise.business_plans.count >= 1
      self.errors.add(:base, "Maximum number of Business Plans reached!")
      return false
    end
  end

end
