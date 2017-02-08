class Api::V1::LocationsController < ApplicationController

  def index
    company = Company.find(params[:company_id])
    render json: company.locations
  end

  def update
    company = Company.find(params[:company_id])
    location = company.locations.find(params[:location_id])
    location.approved!
    render json: location.to_json
  end
end
