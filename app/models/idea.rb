class Idea < ApplicationRecord 
  validates :title, :description, :overview, :impact, :donation_goal, :end_date, :category, :image, presence: true
  validates :end_date, not_in_past: true
  validates :category, presence: true
  after_validation :set_slug, only: [:create, :update]

  attr_accessor :days_left, :pct_funded
  
  mount_uploader :image, ImageUploader
    
  belongs_to :user
  belongs_to :category
  
  has_many :comments
  has_many :donations, through: :perks, source: :donations
  has_many :donors, through: :donations
  has_many :perks, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  accepts_nested_attributes_for :perks, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? } 

  acts_as_votable

  is_impressionable

  scope :active, ->{ where(status: "active") }
  scope :inactive, ->{ where(status: "inactive") }

  def to_param
    "#{id}-#{slug}"
  end

  def impressionist_count
    impressions.size
  end

  def donors
    # find users who donate to a specific campaign
  end

  def donors_count
    perks.map do |perk|
      perk.donations_count
    end.reduce(:+)
  end

  def donated_amount
    perks.map do |perk|
       perk.total_donations
    end.reduce(:+)
  end

  def set_days_left!
    self.days_left = (self.end_date.beginning_of_day.to_i - DateTime.current.to_i) / 86400
  end

  def set_pct_funded!
    self.pct_funded = (100 * self.donated_amount.to_f / self.donation_goal).round(1)
  end

  # def funding_percent
  #   (donated_amount / donation_goal) * 100.0
  # end

  def active?
    status == "active"
  end

  def inactive
    status == "inactive"
  end

  def expired?
    self.expiration_date < Time.current
  end

  # def relevance_bar
  #   "#{idea.impressions.size + idea.get_likes.size + idea.comments.size}"
  # end

  # extend FriendlyId
  # friendly_id :user_id, use: :slugged
end

private

def set_slug
  self.slug = title.to_s.parameterize
end