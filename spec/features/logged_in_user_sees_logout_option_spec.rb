require 'rails_helper'

RSpec.feature "After stubbing login" do
  scenario "user sees logout option" do
    user = create(:user)

    visit root_path

    expect(page).to have_link("Sign in with Slack")

    stub_login(user)
    visit root_path

    expect(page).to_not have_link("Sign in with Slack")
    expect(page).to have_content("Signed in as #{user.username}")
    expect(page).to have_button("Sign Out")
  end
end
