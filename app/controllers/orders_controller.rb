class OrdersController < ApplicationController
  def new
     @ships = Shipment.where(user_id: current_user.id)
  end

  def modal
    @ship = Shipment.find(params[:shipment_id])

    @carts = Cart.where(user_id: current_user.id)
        total = 0
        @carts.each do |a|
          total += a.amount * a.item.price
        end
    @total_price = total
  end

  def create

    ship = Shipment.find(params[:shipment_id])
          carts = Cart.where(user_id: current_user.id)
              total = 0
              carts.each do |a|
                total += a.amount * a.item.price
              end
      total_price = total

      name = ship.shipment_name
      postal_code = ship.shipment_postal_code
      address = ship.shipment_address

    order = Order.new(user_id: current_user.id, order_name: name, order_postal_code: postal_code, order_address: address, total_price: total_price)
    order.save!

          carts.each do |cart|
    order_items = OrderItem.new(item_id: cart.item.id, amount: cart.amount, order_price: cart.item.price, order_id: order.id)
    order_items.save!
          end

    order_items = OrderItem.where(order_id: order.id)
          order_items.each do |orderitem|
    after_stock = orderitem.item.stock
    after_stock -= orderitem.amount
    orderitem.item.update(stock: after_stock)
          end

    carts.destroy_all

    redirect_to result_order_path(id: order.id)
    flash[:notice] = "ご購入ありがとうございます！"
  end

  def result
    @orders = Order.where(id: params[:id])
    @orderitems = OrderItem.where(order_id: params[:id])
  end

  def show
    @orders = Order.where(id: params[:id])
    @orderitems = OrderItem.where(order_id: params[:id])
  end

  def index
    @orders = Order.where(user_id: current_user.id).order(id: "DESC")
  end

  def flg_update
    order = Order.find(params[:id])
    order.cancell_status = "user_cancell"
    order.save
    redirect_to order_path(params[:id])
  end

  def item_flg_update
    orderitem = OrderItem.find(params[:id])
    orderitem.cancell_status = "user_cancell"
    orderitem.save
    redirect_to order_path(id: orderitem.order.id)
  end

end
