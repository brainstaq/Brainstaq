class Position < ApplicationRecord
  belongs_to :business_plan
  mount_uploader :image, ImageUploader

  validates :bio, length: { maximum: 60 }
end
