require 'rails_helper'

RSpec.describe 'CompanyController' do
  context 'POST /companies' do
    it "can create a company with a name" do
      user_logs_in
      data = { company: {name: "Granicus"}}

      expect(Company.count).to eq(0)
      post '/api/v1/companies', params: data

      expect(response).to be_success
      expect(Company.count).to eq(1)
      expect(Company.first.name).to eq("Granicus")
    end
  end
end
