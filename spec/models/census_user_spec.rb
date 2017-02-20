require 'rails_helper'

RSpec.describe CensusUser do
  context '#create_census_users' do
    it "can create users from census" do
      VCR.use_cassette('.create_census_users') do
        url = "/api/v1/users"
        access_token = "#{ENV['census_access_token']}"

        census = CensusUser.create_census_users(url, access_token)

        expect(census).to be_instance_of(Array)
        expect(census.first).to be_instance_of(CensusUser)
        expect(census.first).to respond_to(:first_name)
        expect(census.first).to respond_to(:last_name)
        expect(census.first).to respond_to(:slack)
        expect(census.first).to respond_to(:email)
      end
    end
  end
end
