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

      it "Shows a text input box for zipcode when clicking companies within checkbox", :js => true do
        visit '/companies'

        check('companies_within')

        within("#within-distance li:nth-of-type(3)") do
          expect(page).to have_css("input[name=zip_input]")
        end
      end
    end
  end

end
