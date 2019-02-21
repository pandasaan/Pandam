class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order(id: "DESC")
  end

  def show
    @order = Order.find(params[:id])
  end

  def flg_update
  end

  def item_flg_update
  end
end
