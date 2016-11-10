class StarredCompaniesController < ApplicationController
  def index
    @starred_companies = current_user.companies.order(name: :asc)
  end

  def create
    company = Company.find(params[:company])
    current_user.star(company)
  end
end
