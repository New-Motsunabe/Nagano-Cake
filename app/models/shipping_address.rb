class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :customer_id, :address_name, :residence, presence: true
end
