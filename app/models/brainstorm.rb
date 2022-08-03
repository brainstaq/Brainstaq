class Brainstorm < ApplicationRecord
  include Facilitated, States, Timed, Printer

  has_one_attached :pdf
  has_many :concepts
  attr_accessor :name

  validates :problem, presence: { message: "You need to type in a problem to solve." }, :on => [:create, :update]
  validates :name, presence: { message: "Please enter your name."}, :on => :create

  before_validation(on: :create) { self.token ||= generate_token }

  def self.find_sole_by_token(token)
    where("token ilike ?", "%#{token}").then do |relation|
      relation.first if relation.one?
    end
  end

  private

  def generate_token
    "BRAINSTAQ" + SecureRandom.hex(3).to_s
  end
end
