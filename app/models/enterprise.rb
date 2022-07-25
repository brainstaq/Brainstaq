class Enterprise < ApplicationRecord
  enum status: [:inactive, :active]

	validates :name, :info, :address, :email, :phone_number, :country, :category, :image, :website_url, 
  :facebook_url, :twitter_url, :instagram_url, :user_id, :state, :city, presence: true
  
  after_validation :set_slug, only: [:create, :update]
  
  default_scope { order(created_at: :desc)}

  validate :image_size_validation
	mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  # include PublicActivity::Model
  # tracked
	
  belongs_to :user
  belongs_to :category

  has_many_attached :images, dependent: :destroy
  has_many :line_items, inverse_of: :order
  has_many :business_plans, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :pitch_decks, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :products, dependent: :destroy

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = name.to_s.parameterize
  end

  # def check_enterprise_quota
  #   if self.user.enterprises.count >= 5
  #     self.errors.add(:base, "You've reached the maximum number of Brands you can create!")
  #     return false
  #   end
  # end

  def image_size_validation
    #errors[:image] << "should be less than 1MB" if image.size > 1.megabytes
    errors.add(:image, message: "should be less than 1MB") if image.size > 1.megabytes
  end
end
