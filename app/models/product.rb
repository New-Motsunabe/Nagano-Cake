class Product < ApplicationRecord
  has_many :genres, dependent: :destroy
end
