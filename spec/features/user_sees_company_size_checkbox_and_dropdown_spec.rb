require 'rails_helper'

RSpec.describe 'As a user' do
  context 'when I visit /companies' do
    it "I see a checkbox for 'at least x employees'" do
      user_logs_in
      visit '/companies'

      expect(page).to have_content("At least X employees")
    end
  end
end
