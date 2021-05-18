class Order < ApplicationRecord
  belongs_to :customer
  
  enum order_status:[
    :waiting,:confirmed,:working,:preparation,:shipping
  ]
  
end
