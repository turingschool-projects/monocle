class Api::V1::LocationsController < ApplicationController
  def update
    location = Location.find(params[:id])
    location.approved!
    render json: location.to_json
  end
end
