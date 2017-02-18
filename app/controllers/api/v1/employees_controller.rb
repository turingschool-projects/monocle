class Api::V1::EmployeesController < ApplicationController

  skip_before_action :authorize!, only: [:update]

  def create
    Company.find(get_company_id).employees << current_user
    render json: {status: 'success'}, status: 201
  end

  private

  def get_company_id
    params.permit(:company_id)['company_id']
  end

end
