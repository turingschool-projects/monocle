class Api::V1::CompanySearchController < ApplicationController

    skip_before_action :authorize!, only: [:show]

  def show
    render json: Company.find_by(name: params[:name]).id
  end

end
