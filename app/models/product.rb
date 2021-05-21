class Product < ApplicationRecord

  belongs_to :genre, dependent: :destroy

    def tax_price
        (self.price * 1.1).round
    end


  has_many :ordered_products, dependent: :destroy
  # has_many :orders, class_name: "OrderedProduct", foreign_key: "order_id", dependent: :destroy
  has_many :orders, through: :ordered_products
  # has_many :ordereds, through: :orders, source: :product

  attachment :image, destroy: false

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :image, presence: true

  has_many :cart_items, dependent: :destroy
end
