class Api::V1::Admin::CensusUsersController < ApplicationController

  def index
    census_users = CensusUser.create_all_census_users('/api/v1/users/', current_user.census_access_token)
    full_names = CensusUser.combine_names(census_users)
    render json: full_names, status: 201
  end

end
