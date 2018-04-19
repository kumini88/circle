class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_to :back
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    redirect_to :back
  end
end
