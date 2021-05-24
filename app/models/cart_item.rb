class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  attachment :image, destroy: false

  validates :amount, presence: true
end
