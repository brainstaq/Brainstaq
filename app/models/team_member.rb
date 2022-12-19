class TeamMember < ApplicationRecord
  # validates :full_name, :position_id, :bio, :image, presence: true
  belongs_to :business_plan
  mount_uploader :image, ImageUploader

  validates :bio, length: { maximum: 60 }
end
