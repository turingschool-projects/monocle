class Api::V1::LocationsController < ApplicationController

  def index
    company = Company.find(params[:company_id])
    render json: company.locations
  end

  def update
    location = Location.find(params[:id])
    location.approved!
    render json: location.to_json
  end
end
