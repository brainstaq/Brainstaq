class Invoice < ApplicationRecord
	validates :from_full_name, :from_address, :from_email, :from_phone, :to_full_name, 
	:to_address, :to_email, :to_phone, :enterprise_id, presence: true

  belongs_to :enterprise
  has_many :invoice_items, dependent: :destroy
	accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

	# STATUS_CLASS = {
	# 	:draft => "badge badge-secondary",
	# 	:sent => "badge badge-primary",
	# 	:paid => "badge badge-success"
	# }

	def subtotal
		self.invoice_items.map { |invoice_item| invoice_item.qty * invoice_item.price }.sum
	end

	def discount_calculated
		subtotal * (self.discount / 100.0)
	end

	def vat_calculated
		(subtotal - discount_calculated) * (self.vat / 100.0)
	end

	def total
		subtotal - discount_calculated + vat_calculated
	end

	# def status_class
	# 	STATUS_CLASS[self.status.to_sym]
	# end
end
