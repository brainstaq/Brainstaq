class Feature < ApplicationRecord
  belongs_to :subscription_plan
  validates_presence_of :name, :description
end

