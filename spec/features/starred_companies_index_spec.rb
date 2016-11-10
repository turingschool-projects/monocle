require 'rails_helper'

RSpec.feature "User navigates to the starred companies path" do
  scenario "they see all companies they have starred" do
    bob = create(:user)
    stub_login(bob)
    bobs_favorites = create_list(:company, 2)
    bob.companies << bobs_favorites
    ann = create(:user)
    anns_favorite = create(:company)

    visit root_path
    click_on "My Starred Companies"

    expect(current_path).to eq(starred_companies_path)
    expect(page).to have_content("Company Name:", count: 2)
    bobs_favorites.each do |company|
      expect(page).to have_link(company.name, href: company_path(company))
      expect(page).to have_content(company.phone)
    end
    expect(page).to_not have_content(anns_favorite.name)
  end
end
