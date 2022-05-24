class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def unsubscribe
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to users_path(user.id)
    else
      render :edit
    end
  end
end
