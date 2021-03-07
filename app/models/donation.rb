class Donation < ApplicationRecord
  belongs_to :user, foreign_key: :donor_id, class_name: "User"
  belongs_to :idea
  # belongs_to :perk #optional: true

  # def perk_id
  #   @perk.idea_id
  # end
end

