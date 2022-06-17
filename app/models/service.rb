class Service < ApplicationRecord
  validates :title, :description, :image, presence: true

  belongs_to :enterprise
  mount_uploader :image, ImageUploader
end
