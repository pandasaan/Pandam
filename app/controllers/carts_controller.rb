class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_stock, only: [:create]
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

  def confirm_stock
    stock = Item.find(params[:item_id]).stock
    if stock.zero?
      flash[:alert] = "お選びの商品は現在売り切れのため選択できません"
      redirect_to root_path
    end
  end

end
