require 'rails_helper'

RSpec.feature "Guest user attempts to visit" do
  context "root path" do
    scenario "they see the root path" do
      visit root_path

      expect(page).to have_http_status(200)
      expect(page).to have_content("Welcome to Monocle")
      expect(page).to have_link("Sign in with Slack")
      expect(page).to_not have_css(".navbar")
      expect(page).to_not have_content("Directory")
    end
  end

  context "companies#index" do
    scenario "they see the root path" do
      visit companies_path

      expect(page).to have_http_status(404)
      expect(page).to have_content("The page you were looking for doesn't exist")
      expect(page).to_not have_css(".navbar")
      expect(page).to_not have_content("Directory")
    end
  end
end
