class GroupsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
  def show
    @group = Group.find(params[:id])
    @member_users = @group.member_users.order("created_at DESC").page(params[:page])
    @applicant_users = @group.applicant_users.order("created_at DESC").page(params[:page])
    @group_followers = @group.group_followers.order("created_at DESC").page(params[:page])
    @posts = @group.posts("created_at DESC").page(params[:page])
    @events = @group.events("created_at DESC").page(params[:page])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    
    if @group.update(group_params)
      redirect_to @group
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def new
    @group = Group.new
    @groups = current_user.member_groups
  end

  def create
    @group = Group.new(group_params)
    @groups = current_user.member_groups.page(params[:page])
    
    if @group.save
      member = Member.new(user_id: current_user.id, group_id: @group.id, owner: true)
      member.save
    else
      flash.now[:danger] = "作成に失敗しました"
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :group_id, :profile, :image, :twitter, :facebook, :instagram, :otherlinka, :otherlinkb)
  end
end
