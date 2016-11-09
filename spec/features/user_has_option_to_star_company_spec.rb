require 'rails_helper'

RSpec.feature "User has option to star a company unless already starred" do
  context "they have not starred the company" do
    scenario "they see a button to star it" do
      user = create(:user)
      stub_login(user)
      company = create(:company)

      visit company_path(company)

      expect(page).to_not have_content("You have starred this listing.")
      expect(page).to have_button("Star")
    end
  end

  context "they have starred the company" do
    scenario "they see a message and no button" do
      user = create(:user)
      stub_login(user)
      company = create(:company)
      user.companies << company

      visit company_path(company)

      expect(page).to have_content("This company has been saved in your starred list.")
      expect(page).to_not have_button("Star")
    end
  end
end
