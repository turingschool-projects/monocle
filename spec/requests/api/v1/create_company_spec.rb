require 'rails_helper'

RSpec.describe 'CompanyController' do
  context 'POST /api/v1/companies' do
    it "can create a company with a name" do
      data = { company: {name: "Granicus"}, token: "TurMonLook4", location: {name: nil}}

      expect(Company.count).to eq(0)
      post '/api/v1/companies', params: data

      expect(response).to be_success
      expect(Company.count).to eq(1)
      expect(Company.first.name).to eq("Granicus")
    end

    it "creates a company that is pending" do
      data = { company: {name: "Granicus"}, token: "TurMonLook4", location: {name: nil}}

      post '/api/v1/companies', params: data

      expect(response).to be_success
      expect(Company.last.status).to eq('pending')
      expect(Location.last).to eq(nil)
    end

    it 'does not create a location if the name comes as nil' do
      data = { company: {name: "Granicus"}, token: "TurMonLook4", location: {name: nil}}

      post '/api/v1/companies', params: data

      expect(response).to be_success
      expect(Location.last).to eq(nil)
    end

    it "creates a company with approved location" do
      location = {
        street_address: '1331 17th St',
        city: 'Denver',
        state: 'CO',
        zip_code: '80202'
      }
      data = { company: {name: "Granicus"}, token: "TurMonLook4", location: location}

      post '/api/v1/companies', params: data

      location = Location.last

      expect(response).to be_success
      expect(Company.last.status).to eq('pending')
      expect(location.status).to eq('approved')
      expect(location.street_address).to eq('1331 17th St')
    end

    xit "can't create company without key" do
      location = {
        street_address: '1331 17th St',
        city: 'Denver',
        state: 'CO',
        zip_code: '80202'
      }
      data = { company: {name: "Granicus"}, location: location }

      expect(Company.count).to eq(0)
      post '/api/v1/companies', params: data
      parsed = JSON.parse(response.body)


      expect(response.status).to eq(401)
      expect(parsed['error']).to eq('unauthorized')
    end
  end

  context 'GET api/v1/company/find' do
    it "can find a company" do
      company = Company.create(name: "Granicus")
      data = { name: "Granicus" }

      get '/api/v1/companies/find', params: data

      parsed = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed['company_id']).to eq(company.id)
    end

    it "can't find a non existent company" do
      data = { name: "Granicus" }

      get '/api/v1/companies/find', params: data
      parsed = JSON.parse(response.body)

      expect(response.status).to eq(404)
      expect(parsed).to eq({'error' => 'company not found'})
    end
  end
end
