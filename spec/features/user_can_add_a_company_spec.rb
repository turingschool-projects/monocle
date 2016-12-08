require 'rails_helper'

describe "user can add a company" do
  it "and then see pending approval" do

    industry = Industry.create(name: "Applesauce")

    user = create(:user)
    stub_login(user)
    
    visit '/companies'
    click_on "Add Company"
    fill_in "company_name", with: "Monocle"
    fill_in "company_website", with: "www.monocle.com"



    fill_in "company_headquarters", with: "Denver, CO"
    fill_in "company_products_services", with: "Jobs"
    # upload a logo
    # Choose a size from dropdown
    select "100-150", from: "size"
    fill_in "street_address", with: "1234 Blake St."
    fill_in "street_address_2", with: ""
    select 'Colorado', from: 'state'
    fill_in "city", with: "Denver"
    click_button "Create Company"
    fill_in "zip_code", with: "80202"

    company = Company.last
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Company is pending approval.")
  end
end
