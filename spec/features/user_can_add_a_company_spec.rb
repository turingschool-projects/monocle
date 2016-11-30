require 'rails_helper'

describe "user can add a company" do
  it "and then see pending approval" do
    # As a user,
    user = create(:user)
    stub_login(user)
    visit '/companies'
    # When I click "Add Company"
    click_on "Add Company"
    # And I fill in the company name
    fill_in "company_name", with: "Monocle"
    # And I fill in at least one address for the company
    fill_in "company_street_address", with: "1234 Main St"
    fill_in "company_city_state_zip", with: "Denver, CO, 80203"
    fill_in "company_phone", with: "123-456-789"
    fill_in "company_website", with: "www.monocle.com"
    fill_in "company_headquarters", with: "Denver, CO"
    fill_in "company_products_services", with: "Jobs"
    fill_in "company_person_in_charge", with: "Dan Broadbent"
    # And I click submit
    click_button "Create Company"
    # THEN I see a confirmation page
    
    company = Company.last
    expect(current_path).to eq(company_path(company))
    # and I see a message saying company is pending approval
    expect(page).to have_content("Company is pending approval")
  end
end