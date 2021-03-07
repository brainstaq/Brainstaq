class Perk < ApplicationRecord
  belongs_to :idea

  # has_many :donations, through: :ideas
  # has_many :users
end
