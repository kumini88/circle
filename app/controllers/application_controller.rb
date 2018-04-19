class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_search
  
  include SessionsHelper
  include ToppagesHelper
  
  def set_search
    @search = [User.ransack(params[:q]), Group.ransack(params[:q]), Company.ransack(params[:q])] 
    @search_users = @search[0].result.page(params[:page])
    @search_groups = @search[1].result.page(params[:page])
    @search_companies = @search[2].result.page(params[:page])
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
