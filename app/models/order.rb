class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  enum order_status:[
    :waiting,:confirmed,:working,:preparation,:shipping
  ]

end
