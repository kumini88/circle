class CommentsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]

  def new
    @comment = current_user.comments.build
  end

  def create
    @post = Post.find_by(params[:id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @comment.save
    @comments = current_user.comments.order("created_at DESC").page(params[:page])
  end

  def destroy
    @comment.destroy
    redirect_to "/"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
