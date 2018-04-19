class ClipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    event = Event.find(params[:event_id])
    current_user.clip(event)
    redirect_to :back
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.unclip(event)
    redirect_to :back
  end
end
