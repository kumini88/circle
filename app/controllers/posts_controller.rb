class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  before_action :correct_user, only: [:destroy]
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @group = @post.group
    @company = @post.company
    @comments = @post.comments.page(params[:page])
  end

  def new
    @post = current_user.posts.build
    @groups = current_user.member_groups
    @companies = current_user.member_companies
  end

  def create
    @post = current_user.posts.build(post_params)
    @posts = current_user.posts.order("created_at DESC").page(params[:page])
    unless @post.save
      flash[:danger] = "投稿に失敗しました"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end
  
  def favorite_users
    @post = Post.find(params[:id])
    @favorite_users = @post.favorite_users.page(params[:page])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image, :group_id, :company_id)
  end
  
  def correct_user
    @post = current_user.posts.find_by(params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
