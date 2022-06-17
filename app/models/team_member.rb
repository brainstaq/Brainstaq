class TeamMember < ApplicationRecord
  validates :full_name, :position, :bio, :image, presence: true

  belongs_to :enterprise
  mount_uploader :image, ImageUploader

  validates :bio, length: { maximum: 60 }
end
