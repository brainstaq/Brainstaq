class SubscriptionPlan < ApplicationRecord
  has_many :users
  has_many :features, dependent: :destroy

  enum status: [:active, :deactivated]
  enum duration: [:monthly, :annually]


  validates :plan_name, :cost, :duration, :description, presence: true
  validates :recurring, :inclusion => {:in => [true, false]}

  accepts_nested_attributes_for :features, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? } 

  scope :active_plans, -> {
    where(status: 0)
  }

  def self.options_for_select
    order('LOWER(plan_name)').map { |e| [e.plan_name, e.id]}
  end
end
