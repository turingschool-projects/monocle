class Admin::CompaniesController < ApplicationController
  before_action :verify_admin

  def index
    # @pending_locations = Company.pending_locations
    @pending_companies = Company.pending_companies
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      flash[:notice] = "Company information updated."
      redirect_to company_path(company)
    else
      flash.now[:danger] = company.errors.full_messages
      render :edit
    end
  end

  private
    def company_params
      params.require(:company).permit(:name,
                                      :website,
                                      :headquarters,
                                      :products_services,
                                      :status,
                                      :size,
                                      :logo)
    end
end
