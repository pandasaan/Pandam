class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @order = Order.all
  end

  def edit
  end

  def update
  end

  def cancel
  end

  def flg_update
  end
end
