class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  enum work_status:{
    "製作不可":0, "製作待ち":1, "製作中":2, "製作完了":4
  }



end

