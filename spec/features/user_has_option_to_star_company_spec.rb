require 'rails_helper'

RSpec.feature "User can save a company to their list" do
  scenario "the company is added to their saved list" do
    # As a logged in user
    company = create(:company)
    user    = create(:user)
    stub_login(user)
    # when I navigate to a company show page
    visit company_path(company)

    expect(user.companies.count).to eq(0)
    expect(page).to_not have_content("You have starred this listing.")
    # and I click interested

    expect(page).to have_button("Star")
    # then I stay on the same page
    # expect(page).to have_content("You have starred this listing.")
    # expect(user.companies.count).to eq(1)
    # and my interested count increases by 1
  end
end
