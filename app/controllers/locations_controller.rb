class LocationsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @location = Location.new
  end

  def create
    company = Company.find(params[:company_id])
    location = company.locations.new(location_params)
    if location.save
      flash[:notice] = 'Location pending approval'
      redirect_to company_path(company)
    else
      flash.now[:error] = location.errors.full_messages.join(', ')
      redirect_to new_company_location_path
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @location = Location.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @location = Location.find(params[:id])
    @location.assign_attributes(location_params)

    if @location.save
      @location.pending!
      flash[:notice] = 'Update pending approval'
      redirect_to company_path(@company)
    else
      flash.now[:error] = @location.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
  end

  private
    def location_params
      params.require(:location).permit(:street_address,
                                        :street_address_2,
                                        :phone,
                                        :primary_contact,
                                        :state,
                                        :city,
                                        :zip_code)
                                .merge({state: params[:state]})
    end

end
