class Api::V1::EmployeesController < ApplicationController

  skip_before_action :authorize!, only: [:update]

  def update
    Company.find(get_company_id).employees << User.find(get_user_id)
    render json: {status: 'success'}, status: 201
  end

  private

  def get_user_id
    params.permit(:user_id)['user_id']
  end

  def get_company_id
    params.permit(:company_id)['company_id']
  end

end
