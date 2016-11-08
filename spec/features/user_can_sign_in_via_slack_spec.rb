require 'rails_helper'

RSpec.feature "User signs in via slack" do
  context "they grant access" do
    scenario "they are signed in successfully" do
      # As a registered slack user
      # when I visit the home page
      visit root_path
      # and I click sign in with slack
      click_on "Sign in with Slack"
      # and I grant access
      # then I am directed my starred listings page
      expect(current_path).to eq(user_show(user))
      # and I see a confirmation flash message

      # and I see my user name
      # and I see a button to log out
      # and I no longer see the sign in with slack link
    end
  end
end

# As a registered slack user
# when I visit the home page
# and I click sign in with slack
# and I do not grant access
# then I am directed to the home page
# and I see an error flash message
# and I don't see my user name
# and I don't see a button to log out
# and I see the sign in with slack link
