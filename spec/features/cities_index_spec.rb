require 'rails_helper'

RSpec.feature "User navigates to the all cities path" do
  scenario "they see all cities and a link for each" do
    user = create(:user)
    stub_login(user)
    fixture_file = "agricultural_technology.txt"
    path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)
    SeedFixtureData.run(path)

    visit companies_path
    click_on "Company Directory"
    click_on "By City"

    City.all.each do |city|
      expect(page).to have_link(city.name, href: city_path(city))
      expect(page).to have_content(city.companies.count)
    end
  end
end
