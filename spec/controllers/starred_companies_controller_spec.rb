require 'rails_helper'

RSpec.describe StarredCompaniesController, type: :controller do
  describe "POST create" do
    it "associates user and company" do
      user = create(:user)
      company = create(:company)
      stub_login(user)

      params = {company: company.id}

      expect{post :create, params: params}.to change{user.companies.count}.from(0).to(1)
    end
  end
end
