class EventsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  before_action :correct_user, only: [:destroy]
  
  def show
    @event = Event.find_by(params[:id])
    @user = @event.user
    @group = @event.group
    @company = @event.company
    @eventcomments = @event.eventcomments.page(params[:page])
  end

  def new
    @event = current_user.events.build
    @events = current_user.events
    @groups = current_user.member_groups
    @companies = current_user.member_companies
  end

  def create
    @event = current_user.events.build(event_params)
    @events = current_user.events.order("created_at DESC").page(params[:page])
    unless @event.save
      flash[:danger] = "投稿に失敗しました"
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end
  
  def clip_users
    @event = Event.find(params[:id])
    @clip_users = @event.clip_users.page(params[:page])
  end
  
  def join_users
    @event = Event.find(params[:id])
    @join_users = @event.join_users.page(params[:page])
  end
  
  private
  
  def event_params
    params.require(:event).permit(:content, :image, :title, :place, :date, :group_id, :company_id)
  end
  
  def correct_user
    @event = current_user.events.find_by(params[:id])
    unless @event
      redirect_to root_url
    end
  end
end
