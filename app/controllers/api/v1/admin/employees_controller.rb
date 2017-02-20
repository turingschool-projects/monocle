class Api::V1::Admin::EmployeesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(username: "#{params[:first_name]} #{params[:last_name]}")
    company = Company.find(params[:company_id])
    employee = Employee.new(
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
    require "pry"; binding.pry
  end

end
