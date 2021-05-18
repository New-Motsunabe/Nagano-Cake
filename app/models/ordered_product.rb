class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  enum work_status:[
    :cannot,:wait,:make,:finish
  ]

end
