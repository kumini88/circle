class CompaniesController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
  def show
    @company = Company.find(params[:id])
    @member_users = @company.member_users.order("created_at DESC").page(params[:page])
    @company_followers = @company.company_followers.order("created_at DESC").page(params[:page])
    @posts = @company.posts("created_at DESC").page(params[:page])
    @events = @company.events("created_at DESC").page(params[:page])
    @reviews = @company.reviews("created_at DESC").page(params[:page])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    
    if @company.update(company_params)
      redirect_to @company
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
      
    if @company.save
      companymember = Companymember.new(user_id: current_user.id, company_id: @company.id, owner: true)
      companymember.save
      redirect_to @company
    else
      flash[:danger] = "企業の登録に失敗しました。" 
      render :new
    end
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :profile, :image, :twitter, :facebook, :officiallink)
  end
end
