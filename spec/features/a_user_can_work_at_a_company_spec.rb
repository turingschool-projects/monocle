require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'when I navigate to the company show page' do
    it "I see a button that says 'I work here'" do
      user_logs_in
      company = create(:company)

      visit company_path(company)

      expect(page).to have_content("I work here")
    end
  end
end
