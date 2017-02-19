class FindingsController < ApplicationController
  def create
    finding = Finding.create(finding_params)
    params[:finding][:technology_tokens].split(",").each do |id|
      finding.technologies << Technology.find(id)
    end
    redirect_to company_path()
  end

  private

    def finding_params
      params.require(:finding).permit(:viability, :hiring)
    end
end
