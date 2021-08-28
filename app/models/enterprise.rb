class Enterprise < ApplicationRecord
  enum status: [:inactive, :active]
	after_validation :set_slug, only: [:create, :update]
	mount_uploader :image, ImageUploader
	belongs_to :user
end
