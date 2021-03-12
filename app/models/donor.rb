class Donor < ApplicationRecord
  belongs_to :user
  has_many :donations

  default_scope { order(created_at: :desc)}
end
