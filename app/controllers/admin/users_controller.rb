class Admin::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(user.id)
    @order = Order.all
  end

  def edit
    @users =User.find(user.id)
  end

  def update
    @users =User.find(params[:id])
    @users.update(user_params)
    redirect_to user_path(params[:id])
  end

  def flg_update
  end
  private
    def user_params
        params.require(:user).permit(:name, :name_kana,:postal_code,:address,:tell,:email)
    end
end
