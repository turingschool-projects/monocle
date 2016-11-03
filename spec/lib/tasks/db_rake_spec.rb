# Reference: https://robots.thoughtbot.com/test-rake-tasks-like-a-boss

require 'rails_helper'
require 'rake'

RSpec.describe "db:seed_test_fixture" do
  include_context "rake"

  it "seeds the test database from the fixture data" do
    fixture_file = "agricultural_technology.txt"
    fixture_path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)

    subject.invoke(fixture_path)

    expect(Company.count).to eq(10)
  end
end
