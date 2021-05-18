class Product < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

  attachment :image, destroy: false
end
