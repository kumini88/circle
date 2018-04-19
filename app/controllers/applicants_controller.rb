class ApplicantsController < ApplicationController
  before_action :require_user_logged_in
  def create
    group = Group.find(params[:group_id])
    current_user.applicant(group)
    redirect_to group
  end
  
  def destroy
    group = Group.find(params[:group_id])
    current_user.unapplicant(group)
    redirect_to group
  end
end
