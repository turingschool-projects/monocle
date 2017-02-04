class StarredCompaniesController < ApplicationController

  def create
    company = Company.find(params[:company_id]).order(created_at: :desc)
    current_user.star(company)
  end

  def destroy
    current_user.companies.destroy(params[:id])
  end
end
