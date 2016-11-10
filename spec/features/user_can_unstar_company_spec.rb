require 'rails_helper'

RSpec.feature "User can unstar a starred company" do
  scenario "they see a button to star it" do
    user = create(:user)
    stub_login(user)
    company = create(:company)
    user.companies << company

    visit starred_companies_path

    expect(page).to have_content(company.name)

    click_link("Remove from starred companies")

    expect(current_path).to eq(starred_companies_path)
    expect(user.companies.count).to eq(0)
    expect(page).to_not have_content(company.name)
    expect(page).to have_content("Company removed from starred list")
  end
end
