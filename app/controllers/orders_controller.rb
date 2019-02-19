class OrdersController < ApplicationController
  def new

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

    if order.save
    redirect_to new_order_path
    else
    redirect_to new_order_path
    flash[:notice] = "失敗"
    end

  end

  def show
        flash[:notice] = "ご購入ありがとうございます！"
    redirect_to result_order_path
  end

  def index
  end

  def result
    @orders = Order.where(user_id: current_user.id)
  end

  def flg_update
  end

  def item_flg_update
  end


end
