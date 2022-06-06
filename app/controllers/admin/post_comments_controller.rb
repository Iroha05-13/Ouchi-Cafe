class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
  end

  def destroy
    user = User.find(params[:user_id])
    PostComment.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

end
