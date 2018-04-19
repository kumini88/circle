class GrouprelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    group = Group.find(params[:group_id])
    current_user.groupfollow(group)
    redirect_to :back
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.ungroupfollow(group)
    redirect_to :back
  end
end
