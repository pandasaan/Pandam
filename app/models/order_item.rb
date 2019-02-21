class OrderItem < ApplicationRecord
  enum cancell_status: { normal: 0, user_cancell: 1, cancell_accepted: 2 }

  belongs_to :item
  belongs_to :order

end
