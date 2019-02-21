class Order < ApplicationRecord
  enum dlv_status: {order_accepted: 0, getting_ready: 1, delivery_completed: 2}
  enum cancel_status: {nomal: 0, user_cancel: 1, cancel_accepted: 2}

  belongs_to :user
  has_many :order_items
end