require 'rails_helper'

RSpec.describe 'admin approves of company location on company show page' do
  it 'sees a newly added company location and approves' do
    VCR.use_cassette('admin_location_approval') do
      admin_logs_in
      company = create_approved_company('Test Company')
      location = add_unapproved_location_to_company(company)
      visit company_path(company)
      click_on "Approve"

      expect(page).to have_content('Company location information updated')
      expect(company.locations.last.approved?).to eq(true)
    end
  end
end
