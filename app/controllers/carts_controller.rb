class CartsController < ApplicationController
  before_action :authenticate_user!
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
    @cart = Cart.find(params[:id])
    @cart.update(amount_params)
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private
  def amount_params
    params.require(:cart).permit(:amount)
  end

end
