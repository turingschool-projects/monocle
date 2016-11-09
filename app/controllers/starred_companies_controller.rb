class StarredCompaniesController < ApplicationController
  def create
    company = Company.find(params[:company])
    current_user.star(company)
  end
end
