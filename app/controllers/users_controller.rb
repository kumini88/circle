class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
    
  def show
    @user = User.find(params[:id])
    @followings = @user.followings.order("created_at DESC").page(params[:page])
    @followers = @user.followers.order("created_at DESC").page(params[:page])
    
    @posts = @user.posts.order("created_at DESC").page(params[:page])
    @favorite_posts = @user.favorite_posts.order("created_at DESC").page(params[:page])
    
    @events = @user.events.order("date DESC").page(params[:page])
    @clip_events = @user.clip_events.order("date DESC").page(params[:page])
    @join_events = @user.join_events.order("date DESC").page(params[:page])
    
    @member_groups = @user.member_groups.order("created_at DESC").page(params[:page])
    @applicant_groups = @user.applicant_groups.order("created_at DESC").page(params[:page])
    @following_groups = @user.following_groups.order("created_at DESC").page(params[:page])
    
    @member_companies = @user.member_companies.order("created_at DESC").page(params[:page])
    @following_companies = @user.following_companies.order("created_at DESC").page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:danger] = "ユーザの登録に失敗しました。" 
      render :edit
    end
  end
  
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
      
    if @user.save
      redirect_to "/"
    else
      flash[:danger] = "ユーザの登録に失敗しました。" 
      render :new
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :user_id, :profile, :password, :image, :twitter, :facebook, :linkedin, :instagram, :otherlinka, :otherlinkb, :highschool, :college, :grschool, :major, :job, :gyokai, :occupation, :password_confirmation)
  end
end
