class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :collect_user, only: [:show]

  def top
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def collect_user
  	item = Item.find(params[:id])
    orders = Order.where(user_id: current_user.id)
      orders.each do |order|
  		@orderitem = OrderItem.find_by(order_id: order.id, item_id: item.id)
	    if @orderitem.present?
	      break
	    end
	  end
	  if  @orderitem.nil?
	      flash[:alert] = "閲覧できません。"
	      redirect_to user_path(current_user.id)
       end
  end

end