class User < ApplicationRecord
  attr_accessor :login 

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 

  mount_uploader :image, ImageUploader
  
  #has_secure_password

  has_many :ideas, dependent: :destroy
  # has_many :ideas, :through => :donations, :source => :idea
  has_many :donations, through: :ideas
  has_many :comments, dependent: :destroy

  has_many :conversations, foreign_key: :sender_id, dependent: :destroy

  has_many :visits, class_name: "Ahoy::Visit"

  acts_as_voter

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  
  # has_one_attached :image, dependent: :destroy
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def show
    @user = User.find(params[:id])
  end 
  
  def total_following
    Follow.where(followee_id: self.id).count
  end

  def total_followers
    Follow.where(follower_id: self.id).count
  end

  # def country_name
  #   country = ISO3166::Country[country_code]
  #   country.translations[I18n.locale.to_s] || country.name
  # end

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value", 
        { value: login.strip.downcase}]).first
  end

  def donated_amount
    self.donated_amount = @donation.sum(:amount).to_f / 100
   end
end
