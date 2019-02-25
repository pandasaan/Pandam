class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).order(id: "DESC")
  end

  def show
    @order = Order.find(params[:id])
  end

  def dlv_flg_update
    order = Order.find(params[:id])
    order.update(dlv_status_params)
    flash[:notice] = "手配状況を更新しました"
    redirect_to admin_order_path(order.id)
  end

  def flg_update
    order = Order.find(params[:id])
    order.update(cancel_params)
    flash[:notice]  = "キャンセル対応状況を更新しました"
    redirect_to admin_order_path(order.id)
  end

  def item_flg_update
    order_item = OrderItem.find(params[:id])
    order_item.update(item_cancel_params)
    flash[:notice] = "個別キャンセル状況を更新しました"
    redirect_to admin_order_path(order_item.order.id)
  end

  private

  def dlv_status_params
    params.require(:order).permit(:dlv_status)
  end

  def cancel_params
    params.require(:order).permit(:cancell_status)
  end

  def item_cancel_params
    params.require(:order_item).permit(:cancell_status)
  end
end
