require 'rails_helper'

describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'when I visit a company show page' do
    scenario 'I enter an invalid zipcode and get an error' do

      company = create_approved_company("Test Company")
      visit '/companies/1'

      expect(page).to have_content("Add Findings")
      # check('companies_within')
      #
      # fill_in 'zip', with: '023'
      # click_button 'Go'
      #
      # expect(page).to have_content('Please enter a valid zipcode')
      # expect(page).to have_content(denver_co.locations.first.street_address)
      # expect(page).to have_content(boulder_co.locations.first.street_address)
    end
  end
end
