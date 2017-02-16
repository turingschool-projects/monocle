require 'rails_helper'

RSpec.describe 'CompanyController' do
  context 'POST /api/v1/companies' do
    it "can create a company with a name" do
      data = { company: {name: "Granicus"}}

      expect(Company.count).to eq(0)
      post '/api/v1/companies', params: data

      expect(response).to be_success
      expect(Company.count).to eq(1)
      expect(Company.first.name).to eq("Granicus")
    end
  end
  context 'GET api/v1/company/find' do
    it "can find a company" do
      company = Company.create(name: "Granicus")
      data = { name: "Granicus" }

      get '/api/v1/companies/find', params: data

      parsed = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed).to eq(company.id)
    end
  end
end
