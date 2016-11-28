class StarredCompaniesController < ApplicationController
  def index
    @starred_companies = current_user.companies.order(name: :asc)
  end

  def create
    company = Company.find(params[:company])
    current_user.star(company)
  end

  def destroy
    current_user.companies.destroy(params[:id])
    redirect_to starred_companies_path, flash: { success: "Company removed from starred list" }
  end
end
