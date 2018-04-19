class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @posts = @user.feed_posts.order("created_at DESC").page(params[:page])
      @events = @user.feed_events.order("created_at DESC").page(params[:page])
    end
  end
  
  def search

  end
end
