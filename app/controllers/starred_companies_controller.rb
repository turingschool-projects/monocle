class StarredCompaniesController < ApplicationController
  def index
    @starred_companies = current_user.companies.order(name: :asc)
  end

  def create
    company = Company.find(params[:company_id])
    current_user.star(company)

    respond_to do |format|
      redirect_to company_path(company)
      format.js
    end
  end

  def destroy
    current_user.companies.destroy(params[:id])
    if request.path == '/starred_companies/*'
      respond_to do |format|
        redirect_to starred_companies_path, flash: { success: "Company removed from starred list" } 
        format.js
      end
    else
      redirect_to :back
    end
  end
end
