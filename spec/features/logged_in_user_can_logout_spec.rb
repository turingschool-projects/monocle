require 'rails_helper'

RSpec.feature "Logged in user logs out" do
  scenario "sees guest home page" do
    user = create(:user)
    stub_login(user)

    visit root_path

    expect(page).to_not have_link("Sign in with Slack")
    expect(page).to have_content("Signed in as #{user.username}")
    expect(page).to have_button("Sign Out")

    click_button "Sign Out"

    expect(page).to have_link("Sign in with Slack")
    expect(page).to have_content("Signed in as #{user.username}")
    expect(page).to have_button("Sign Out")
  end
end
