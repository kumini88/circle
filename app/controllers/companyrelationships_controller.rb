class CompanyrelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    company = Company.find(params[:company_id])
    current_user.companyfollow(company)
    redirect_to :back
  end

  def destroy
    company = Company.find(params[:company_id])
    current_user.uncompanyfollow(company)
    redirect_to :back
  end
end
