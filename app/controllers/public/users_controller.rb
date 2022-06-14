class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @orders = @user.orders.order(created_at: :desc).limit(5)
    @post_comments = current_user.post_comments
  end

  def edit
    @user = current_user
  end

  def unsubscribe
  end

  def withdrawal
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
  end
end
