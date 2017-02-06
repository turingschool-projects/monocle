require 'rails_helper'

RSpec.describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'when I visit /companies' do
    VCR.use_cassette('companies_filtering_zip') do
      scenario 'I can input a zip and only the companies within distance are shown', :js => true do
        denver_co  = create_denver_company
        boulder_co = create_boulder_company
        co_springs_co = create_colorado_springs_company

        visit '/'

        check('companies_within')

        select '10', :from => 'distance_select'
        fill_in 'zip', with: '80203'
        click_button 'Go'

        expect(page).to have_content(denver_co.locations.first.street_address)
        expect(page).to_not have_content(boulder_co.locations.first.street_address)
        expect(page).to_not have_content(co_springs_co.locations.first.street_address)
      end

      scenario 'I can choose from the dropdown and have it filter with a range of those miles', :js => true do
        denver_co     = create_denver_company
        boulder_co    = create_boulder_company
        co_springs_co = create_colorado_springs_company

        visit '/'

        check('companies_within')

        select '100', :from => 'distance_select'
        fill_in 'zip', with: '80203'
        click_button 'Go'

        expect(page).to have_content(denver_co.locations.first.street_address)
        expect(page).to have_content(boulder_co.locations.first.street_address)
        expect(page).to have_content(co_springs_co.locations.first.street_address)
      end
    end
  end
end
