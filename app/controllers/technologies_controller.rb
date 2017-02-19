class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.where("name like ?", "%#{params[:q]}%")
    render json: @technologies.map(&:attributes)
  end
end
