class OrdersController < ApplicationController
  def new

    @shipments = Shipment.where(user_id: current_user.id)

    @carts = Cart.where(user_id: current_user.id)
        total = 0
        @carts.each do |a|
          total += a.amount * a.item.price
        end
    @total_price = total

  end

  def create
          carts = Cart.where(user_id: current_user.id)
              total = 0
              carts.each do |a|
                total += a.amount * a.item.price
              end
      total_price = total

      name = current_user.name
      postal_code = "1"
      address = "1"

    order = Order.new(user_id: current_user.id, order_name: name, order_postal_code: postal_code, order_address: address, total_price: total_price)
    order.save!

          carts.each do |cart|
    order_items = OrderItem.new(item_id: cart.item.id, amount: cart.amount, order_price: cart.item.price, order_id: order.id)
    order_items.save!
          end
    redirect_to result_order_path(id: order.id)
    flash[:notice] = "ご購入ありがとうございます！"
  end

  def show

  end

  def index
  end

  def result
    @orders = Order.find(params[:id])
  end

  def flg_update
  end

  def item_flg_update
  end


end
