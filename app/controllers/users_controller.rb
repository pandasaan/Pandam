class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @orders = Order.where(user_id: current_user)
    @orders_items = OrderItem.where(order_id: @orders)
  end

  def edit
    @users =User.find(current_user.id)
  end

  def update
    @users =User.find(params[:id])
    @users.update(user_params)
    redirect_to user_path(current_user)
  end

  def cancel

  end

  def leave
    user =User.find(current_user.id)
    user.destroy
    redirect_to root_path
  end

  def flg_update
  end
    private
    def user_params
        params.require(:user).permit(:name, :name_kana,:postal_code,:address,:tell,:email)
    end
end
