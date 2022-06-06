class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_comment = PostComment.new
    @item = Item.find(params[:item_id])
  end

  def create
    item = Item.find(params[:item_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    if post_comment.save
      redirect_to item_path(item.id)
    else
      @post_comment = PostComment.new
      @item = Item.find(params[:item_id])
      render :new
    end
  end

  def destroy
    item = Item.find(params[:item_id])
    PostComment.find(params[:id]).destroy
    redirect_to item_path(item.id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :name, :rate, :item_id)
  end
end
