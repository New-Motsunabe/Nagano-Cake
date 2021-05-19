class Genre < ApplicationRecord
  has_many :product

  validates :genre_name, presence: true
end
