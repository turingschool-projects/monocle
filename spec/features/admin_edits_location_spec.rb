require 'rails_helper'

RSpec.feature 'admin edits company location' do
  xit 'clicks edit location button on company page' do
    VCR.use_cassette('admin_company_creation_second') do
      company = create_denver_company
      admin_logs_in
      visit company_path(company)

      expect(page).to have_content("891 14th St, Denver")
      within "#locations" do
        click_on "Edit"
      end
      fill_in 'Street address', with: 'New Address'
      click_on 'Update Location'

      expect(page).to have_content("New Address")
      expect(page).to_not have_content("891 14th St, Denver")
    end
  end
end
