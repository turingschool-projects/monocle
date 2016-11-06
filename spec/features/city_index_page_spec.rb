require 'rails_helper'

RSpec.feature "User navigates to the all cities path" do
  scenario "they see all cities and a link for each" do
    fixture_file = "agricultural_technology.txt"
    path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)

    SeedFixtureData.run(path)

    # as a user,
    # when I go to the home page,
    visit root_path
    # and I click Brwose by city,
    click_on "Browse by City"
    # then I see a list of all cities,
    City.all.each do |city|
      expect(page).to_not have_content(city.name)
      expect(page).to_not have_link(city_name, href: city_path(city))
    end
    # and links to each
  end
end
