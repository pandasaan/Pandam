class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(params[:id])
  end

  def flg_update
    user = User.find(params[:id])
    user.update_column(:user_is_deleted, 1)
    redirect_to admin_user_path(user.id)
  end
  private
    def user_params
        params.require(:user).permit(:name, :name_kana,:postal_code,:address,:tell,:email)
    end

    def flg_params
      params.require(:user).permit(:user_is_deleted)
    end
end
