class CitiesController < ApplicationController
  def index
    @cities = City.includes(:companies).where("length(name) > 3").order(:name)
  end

  def show
    @city = City.includes(:companies).find(params[:id])
  end
end
