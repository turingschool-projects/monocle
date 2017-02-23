class Api::V1::Admin::EmployeesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :verify_admin

  def create
    company = Company.find(params[:company_id])
    user = User.find_by(username: params[:name].capitalize)
    first_name = params[:name].capitalize.split(' ')[0]
    last_name = params[:name].capitalize.split(' ')[1]

    census_users = CensusUser.create_census_users(
      '/api/v1/users/by_name',
      current_user.census_access_token,
      last_name
    )

    found_user = CensusUser.find_user( census_users, first_name, last_name )

    employee = Employee.new(
      census_id: found_user.census_id,
      first_name: found_user.first_name,
      last_name: found_user.last_name,
      email: found_user.email,
      slack: found_user.slack,
      company: company,
      user: user
    )
    if employee.save
      render json: {message: "Successfully created employee_id with census_id #{employee.census_id}"}, status: 201
    else
      render json: {message:"Employee could not be created", status: 500}
    end
  end

end
