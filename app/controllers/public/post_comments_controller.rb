class Public::PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
    @item = Item.find(params[:item_id])
  end

  def create
    item = Item.find(params[:item_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.item_id = item.id
    post_comment.save
    redirect_to item_path(item.id)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to item_path(item.id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :name, :rate, :item_id)
  end
end
