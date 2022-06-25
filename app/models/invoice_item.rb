class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :name, presence: true
  validates :description, presence: true
  validates :qty, presence: true
  validates :price, presence: true
end
