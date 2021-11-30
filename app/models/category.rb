class Category < ApplicationRecord
  has_many :ideas
  has_many :enterprises
end
