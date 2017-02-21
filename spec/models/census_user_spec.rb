require 'rails_helper'

RSpec.describe CensusUser do
  context '#create_census_users' do
    xit "can create users from census" do
      VCR.use_cassette('.create_census_users') do
        name = 'scherer'

        url = "/api/v1/users/by_name"

        access_token = "#{ENV['census_access_token']}"

        census = CensusUser.create_census_users(url, access_token, name)

        expect(census).to be_instance_of(Array)
        expect(census.first).to be_instance_of(CensusUser)
        expect(census.first).to respond_to(:census_id)
        expect(census.first).to respond_to(:first_name)
        expect(census.first).to respond_to(:last_name)
        expect(census.first).to respond_to(:slack)
        expect(census.first).to respond_to(:email)
      end
    end
  end
  context '#find_user' do
    it "can find a user" do
      first = CensusUser.new(
        1,
        "test1_first",
        "test1_last",
        '@test1',
        'test1@test.com'
      )
      second = CensusUser.new(
        2,
        "test2_first",
        "test2_last",
        '@test2',
        'test2@test.com'
      )
      census_users = [first, second]

      result = CensusUser.find_user(census_users, first.first_name, first.last_name)

      expect(result).to eq(first)
    end
    it "finds the first user if two users have the same name" do
      first = CensusUser.new(
        1,
        "test1_first",
        "test1_last",
        '@test1',
        'test1@test.com'
      )
      second = CensusUser.new(
        2,
        "test1_first",
        "test1_last",
        '@test2',
        'test2@test.com'
      )
      census_users = [first, second]

      result = CensusUser.find_user(census_users, first.first_name, first.last_name)

      expect(result).to eq(first)
    end
  end
end
