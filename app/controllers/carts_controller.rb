class CartsController < ApplicationController
  def create
    cart = Cart.new
    cart.user_id = current_user.id
    cart.item_id = Item.find(params[:item_id]).id
    cart.save
    flash[:notice] = "カートへ保存しました！"
    redirect_to carts_path
  end

  def index
    @carts = Cart.where(user_id: current_user.id)
  end

  def update
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end
end
