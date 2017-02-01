require 'rails_helper'

RSpec.describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'when I visit /companies' do
    it "I see a checkbox for 'at least x employees'" do
      visit '/companies'

      expect(page).to have_content("At least X employees")
    end
  end

  context "when I select 'At least X employees'" do
    it "I see a dropdown" do
      visit '/companies'
      find(:css, '#company_size').set(true)

      expect(page).to have_selector("company_sizes")
    end
  end

end
