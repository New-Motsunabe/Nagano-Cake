class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  has_many :order_products, through: :ordered_products, source: :product

  validates :customer_id, :payment_method, :address_name, :postal_code, :residence, presence: true
  validates :postal_code,  presence: true, format: {with: /\A[0-9]+\z/}

  enum order_status:{
    "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4
  }

  enum payment_method:{
    "クレジットカード":0,"銀行振込":1
  }

  def change_work_status #注文ステータスが入金確認であれば制作ステータスを制作待ちにする
    if self.order_status == "入金確認"
      self.ordered_products.update(work_status: "製作待ち")
    end
  end

  def amount
    OrderedProduct.all.sum(:product)
  end

end
