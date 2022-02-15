class Enterprise < ApplicationRecord
  enum status: [:inactive, :active]
	validates :name, :info, :address, :email, :phone_number, :country, :category, :image, :website_url, 
  :facebook_url, :twitter_url, :instagram_url, presence: true
  after_validation :set_slug, only: [:create, :update]

  default_scope { order(created_at: :desc)}

  validate :image_size_validation
	mount_uploader :image, ImageUploader
	
  belongs_to :user
  belongs_to :category

  has_many_attached :images, dependent: :destroy
  has_many :line_items, inverse_of: :order
  has_many :business_plans, dependent: :destroy

  def set_slug
    self.slug = name.to_s.parameterize
  end

  def image_size_validation
    #errors[:image] << "should be less than 1MB" if image.size > 1.megabytes
    errors.add(:image, message: "should be less than 1MB") if image.size > 1.megabytes
  end
end
