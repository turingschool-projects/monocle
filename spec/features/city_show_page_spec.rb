require 'rails_helper'

RSpec.feature "User filters results to one city" do
  xscenario "they see all results from that city and no more" do
    fixture_file = "agricultural_technology.txt"
    path = File.join(Rails.root, "data", "test_fixtures_data", fixture_file)

    SeedFixtureData.run(path)
    fc_companies = City.find_by(name: "Fort Collins").companies.pluck(:name)

    # as a user,
    # when I navigate to the browse by city path,
    visit cities_path
    # and I select Fort collins from the dropdown menu,
    click_on "Fort Collins"
    # then I see all companies from Fort Collins,
    expect(page).to have_content("Company Name", count: fc_companies.count)

    fc_companies.each do |company_name|
      expect(page).to have_content(company_name)
    end
    # and no others
    expect(page).to have_content(City.find_by(name: "Denver").companies.first.name)
  end
end
