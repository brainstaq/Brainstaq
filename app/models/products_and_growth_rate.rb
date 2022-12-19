class ProductsAndGrowthRate < ApplicationRecord
  belongs_to :business_plan
  mount_uploader :product_image, ImageUploader

  # validates :sales_volume_growth_rate_one, presence: true
  # validates :unit_price_growth_rate_one, presence: true
  # validates :sales_volume_growth_rate_two, presence: true
  # validates :unit_price_growth_rate_two, presence: true
  # validates :sales_volume_growth_rate_three, presence: true
  # validates :unit_price_growth_rate_three, presence: true
  # validates :sales_volume_growth_rate_four, presence: true
  # validates :unit_price_growth_rate_four, presence: true
  # validates :sales_volume_growth_rate_five, presence: true
  # validates :unit_price_growth_rate_five, presence: true
  # validates :base_product_price, presence: true
  # validates :monthly_sales_volume, presence: true
end
