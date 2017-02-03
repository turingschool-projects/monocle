require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'when I click favorites' do
    it "shows a list of starred companies" do
      user_logs_in
      visit companies_path
      click_on :favorites

      
    end
  end
end

RSpec.describe 'As an unauthenticated user' do
  context 'when I click favorites' do
    it "shows me an error" do
      visit companies_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
