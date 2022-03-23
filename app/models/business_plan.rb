class BusinessPlan < ApplicationRecord
  validates :executive_summary, :products_and_services, :industry_analysis, :competition, 
  :swot, :operations, :enterprise_id, :marketing, :financial, :appendices, 
  :milestones, :vision, :mission, :objectives, :value_proposition, presence: true

  belongs_to :enterprise
  # belongs_to :user

end
