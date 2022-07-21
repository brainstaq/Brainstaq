class Sub < ApplicationRecord
  enum status: [:inactive, :active]
  has_many :transactions, dependent: :destroy
	belongs_to :user, foreign_key: :user_id  
end
