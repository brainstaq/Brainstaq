class Portfolio < ApplicationRecord
  validates :title, :description, :location, :image, presence: true

  belongs_to :enterprise
  mount_uploader :image, ImageUploader
end
