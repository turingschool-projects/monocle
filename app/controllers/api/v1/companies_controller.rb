class Api::V1::CompaniesController < ApplicationController

  # before_action :secure_creation, only: [:create]
  skip_before_action :authorize!, only: [:create]
  skip_before_action :verify_authenticity_token

  def index
    @companies = Company.pending_and_approved_companies.filter(params.slice(:company_size, :industry_ids, :with_locations_near)).includes(:locations)
  end

  def create
    secure_creation
    company = Company.find_or_initialize_by(company_params)
    if company.save
      location = create_location_for_company(company, location_params)
      render json: company, status: 201
    else
      render json: { failure: "Company could not be created" }, status: 500
    end
  end

  private

    def create_location_for_company(company, location_params)
      if location_params.has_key?(:name)
        return
      else
        approved_location = location_params.merge!({status: 'approved'})
        company.locations.find_or_create_by(approved_location)
      end
    end

    def company_params
      params.require(:company).permit(:name)
    end

    def location_params
      params.require(:location).permit(:name, :street_address, :city, :state, :zip_code)
    end

    def secure_creation
      render json: {error: 'unauthorized'}, status: 401 unless
        params[:token] == "TurMonLook4"
    end

end
