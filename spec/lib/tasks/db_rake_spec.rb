require 'rails_helper'
require 'rake'

describe "db:seed_test_data" do
  fixture_file = "agricultural_technology.txt"
  fixture_path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)
  Rake::Task[db:seed_test_fixture].invoke(fixture_path)

  expect(Company.count).to eq(10)
end
