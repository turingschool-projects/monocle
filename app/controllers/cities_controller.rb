class CitiesController < ApplicationController
  def index
    @cities = City.includes(:companies).order(:name)
  end

  def show
    @city = City.includes(:companies).find(params[:id])
  end
end
