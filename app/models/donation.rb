class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  belongs_to :perk
end