require 'rails_helper'

RSpec.feature "User filters results to one city" do
  scenario "they see all results from that city and no more" do
    user = create(:user)
    stub_login(user)
    fixture_file = "agricultural_technology.txt"
    path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)
    SeedFixtureData.run(path)
    fc_companies = City.find_by(name: "Fort Collins").companies.pluck(:name)
    denver_company = City.find_by(name: "Denver").companies.first

    visit cities_path
    click_on "Fort Collins"
    expect(page).to have_content("Company Name", count: fc_companies.count)

    fc_companies.each do |company_name|
      expect(page).to have_content(company_name)
    end
    expect(page).to_not have_content(denver_company.name)
  end
end
