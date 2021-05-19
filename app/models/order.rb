class Order < ApplicationRecord
  belongs_to :customer
  #has_many :ordered_products, dependent: :destroy
  #has_many :products, class_name: "OrderedProduct", foreign_key: "product_id", dependent: :destroy
  enum order_status:[
    :waiting,:confirmed,:working,:preparation,:shipping
  ]

end
