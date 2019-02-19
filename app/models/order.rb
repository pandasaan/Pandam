class Order < ApplicationRecord
  enum dlv_status: {order_accepted: 0, getting_ready: 1, delivery_completed: 2}
  enum cancell_status: {nomal: 0, user_cancell: 1}

  belongs_to :user, optional: true
  has_many :order_items
end