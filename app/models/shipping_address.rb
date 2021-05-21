class ShippingAddress < ApplicationRecord
  belongs_to :customer
  	validates :customer_id, :address_name, :residence, presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end
