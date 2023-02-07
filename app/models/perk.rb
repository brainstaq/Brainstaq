class Perk < ApplicationRecord
  belongs_to :idea

  has_many :donations
  # has_many :users
end
