class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  # has_many :products, class_name: "OrderedProduct", foreign_key: "product_id", dependent: :destroy
  has_many :products, through: :ordered_products, source: :product

  # has_many :ordered_products, through: :products, source: :order

  #has_many :products, class_name: "OrderedProduct", foreign_key: "product_id", dependent: :destroy
  enum order_status:{
    "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4
  }

  enum payment_method:{
    "クレジットカード":0,"銀行振込":1
  }

  def amount
    OrderedProduct.all.sum(:product)
  end

end
