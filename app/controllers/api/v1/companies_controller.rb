class Api::V1::CompaniesController < ApplicationController

  # skip_before_action :authorize!, only: [:create]

  def index
    @companies = Company.approved_companies.filter(params.slice(:company_size, :industry_ids, :with_locations_near)).includes(:locations)
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: 201
    else
      render json: "Company could not be created", status: 500
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end
