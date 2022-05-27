class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(admin_user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

  def admin_user_params
    params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
  end
end
