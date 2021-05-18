class Product < ApplicationRecord
  has_many :genres, dependent: :destroy

   attachment :image, destroy: false
end
