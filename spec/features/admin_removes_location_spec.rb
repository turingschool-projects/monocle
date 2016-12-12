require 'rails_helper'

RSpec.feature 'admin deletes company location' do
  it 'clicks delete location button on company page' do
    company = create_approved_company
    admin_logs_in
    visit company_path(company)

    expect(page).to have_content("123 Test St City")
    within "#locations" do
      click_on "Delete Location"
    end
    # and I click OK on the alert box
    expect(page).to_not have_content("123 Test St City")
  end
end
