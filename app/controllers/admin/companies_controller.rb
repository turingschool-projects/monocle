class Admin::CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    byebug
  end
end
