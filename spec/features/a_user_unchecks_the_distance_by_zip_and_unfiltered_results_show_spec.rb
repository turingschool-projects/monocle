require 'rails_helper'

RSpec.describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'filtering by zip on companies index' do
    VCR.use_cassette('companies_filtering') do
      xscenario 'I uncheck the companies within distance checkbox and see unfiltered results', :js => true do
        denver_co  = create_denver_company
        boulder_co = create_boulder_company

        visit '/'

        check('companies_within')

        fill_in 'zip', with: '80203'
        click_button 'Go'

        uncheck('companies_within')

        expect(page).to have_content(denver_co.locations.first.street_address)
        expect(page).to have_content(boulder_co.locations.first.street_address)
      end
    end
  end
end
