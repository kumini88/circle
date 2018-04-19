class EventcommentsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]

  def new
    @eventcomment = current_user.eventcomments.build
  end

  def create
    @event = Event.find_by(params[:id])
    @eventcomment = current_user.eventcomments.build(eventcomment_params)
    @eventcomment.event = @event
    @eventcomment.save
    @eventcomments = current_user.eventcomments.page(params[:page])
  end

  def destroy
    @eventcomment.destroy
    redirect_to "/"
  end
  
  private
  
  def eventcomment_params
    params.require(:eventcomment).permit(:content, :user_id, :event_id)
  end
end