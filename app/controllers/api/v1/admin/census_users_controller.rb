class Api::V1::Admin::CensusUsersController < ApplicationController

  def index
    url = "/api/v1/users/"
    render json: CensusService.new.get_all_users(url, current_user.census_access_token), status: 201
  end

end
