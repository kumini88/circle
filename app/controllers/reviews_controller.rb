class ReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :create, :destroy]

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    @company = Company.find_by(params[:id])
    @review.company = @company
    @review.save
    @reviews = current_user.reviews
    unless @review.save
      flash[:danger] = "投稿に失敗しました"
    end
  end

  def destroy
    @review.destroy
    redirect_to root_url
  end
  
  private
  
  def review_params
    params.require(:review).permit(:user_id, :company_id, :title, :public, :content, :userstatus)
  end
  
end
