class Api::V1::Companies::LocationsController < ApplicationController

  def index
    # company = Company.find(params[:id])
    render json: company.locations
  end

  def update
    location = Location.find(params[:id])
    location.approved!
    render json: location.to_json
  end
end
