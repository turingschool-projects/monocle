require 'rails_helper'

RSpec.describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'when I visit /companies' do
    VCR.use_cassette('companies_filtering') do
      it "I see a checkbox for companies within" do
        visit '/companies'

        expect(page).to have_content("Companies Within")
      end

      it "Shows a text input box for zipcode when clicking companies within checkbox" do
        visit '/companies'

        check('companies_within')

        within("#within-distance li:nth-of-type(3)") do
          expect(page).to have_content("Zip")
        end
      end
    end
  end

end
