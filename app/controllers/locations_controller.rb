class LocationsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @location = Location.new
  end

  def create
    @company = Company.find(params[:company_id])
    @location = @company.add_location(location_params)
    if @location.save
      flash[:notice] = 'Location pending approval by moderator'
      redirect_to company_path(@company)
    else
      flash.now[:error] = @location.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @location = Location.find(params[:id])
    require 'pry'; binding.pry
  end

  def update

  end

  def destroy
  end

  private
    def location_params
      params.require('location').permit(:street_address,
                                        :street_address_2,
                                        :phone,
                                        :primary_contact,
                                        :city,
                                        :state,
                                        :zip_code)
    end
end
