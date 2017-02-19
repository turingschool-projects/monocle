class Api::V1::EmployeesController < ApplicationController

  skip_before_action :authorize!, only: [:update, :destroy]

  skip_before_action :verify_authenticity_token

  def create
    Company.find(get_company_id).employees << current_user
    render json: {status: 'success'}, status: 201
  end

  def destroy
    User.find(params[:id]).update(company_id: nil)
  end

  private

  def get_company_id
    params.permit(:company_id)['company_id']
  end

end
