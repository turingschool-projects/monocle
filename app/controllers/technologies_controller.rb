class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json {render json: @technologies.map(&:attributes)}
    end
  end
end
