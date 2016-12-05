require 'rails_helper'

describe "user can add a company" do
  it "and then see pending approval" do

    state = State.create(name: "Colorado")
    city = City.create(name: "Denver")
    zip_code = ZipCode.create(zip_code: "80202")
    industry = Industry.create(name: "Applesauce")

    user = create(:user)
    stub_login(user)
    visit '/companies'
    click_on "Add Company"
    fill_in "company_name", with: "Monocle"
    fill_in "company_website", with: "www.monocle.com"
    fill_in "company_headquarters", with: "Denver, CO"
    fill_in "company_products_services", with: "Jobs"

    click_button "Create Company"
    company = Company.last
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Company is pending approval.")
  end
end
