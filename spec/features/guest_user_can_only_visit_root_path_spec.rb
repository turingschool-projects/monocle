require 'rails_helper'

RSpec.feature "Guest user attempts to visit" do
  context "root path" do
    scenario "they see the root path" do
      visit root_path

      expect(page).to have_content("Welcome to Monocle")
      expect(page).to have_link("Sign in with Slack")
      expect(page).to_not have_content("Directory")
    end
  end
end
