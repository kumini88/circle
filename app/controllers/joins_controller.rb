class JoinsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    event = Event.find(params[:event_id])
    current_user.join(event)
    redirect_to :back
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.unjoin(event)
    redirect_to :back
  end
end
