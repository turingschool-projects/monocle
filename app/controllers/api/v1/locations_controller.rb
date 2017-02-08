class Api::V1::LocationsController < ApplicationController

  def index
    company = Company.find(params[:company_id])
    # approved_locations = company.approved_locations
    # company.pending_locations ? pending_locations = company.pending_locations : pending_locations = "no pending locations"
    render json: company.locations
  end

  def update
    location = Location.find(params[:id])
    location.approved!
    render json: location.to_json
  end
end
