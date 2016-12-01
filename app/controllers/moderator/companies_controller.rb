class Moderator::CompaniesController < ApplicationController
  before_action :verify_moderator_or_admin

  def index
    @pending_companies = Company.pending
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    params[:approve] ? company.approved : company.disapproved
    redirect_to company_path(company)
  end
end
