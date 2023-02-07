class Donation < ApplicationRecord
  validates :perk_id, presence: true
  
  belongs_to :user, foreign_key: :donor_id, class_name: "User"
  belongs_to :idea
  belongs_to :perk

  default_scope { order(created_at: :desc)}
  
end

