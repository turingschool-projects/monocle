class Api::V1::EmployeesController < ApplicationController

  skip_before_action :authorize!, only: [:update, :destroy]

  skip_before_action :verify_authenticity_token

  def create
    company = Company.find(get_company_id)
    employee = Employee.new(
      first_name: current_user.split_username[0],
      last_name: current_user.split_username[1],
      user: current_user,
      company: company
    )

    if employee.save
      render json: {message: 'success'}, status: 201
    else
      render json: {message: 'failed'}, status: 500
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    render json: {message: 'Successfully deleted'}, status: 204
  end

  private

  def get_company_id
    params.permit(:company_id)['company_id']
  end

end
