class Product < ApplicationRecord

  belongs_to :genre, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  has_many :orders, through: :ordered_products
  has_many :cart_items, dependent: :destroy

  attachment :image, destroy: false

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :image, presence: true

  def tax_price #税込価格の計算式
    (self.price * 1.1).round
  end

end
