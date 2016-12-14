require 'rails_helper'

feature "user can filter company by size" do
  it "can see all companies with that size" do
    create_company_with_size("2-10")
    create_company_with_size("11-50")
    user_logs_in
    
    visit '/'
    
    expect(page).to have_content('Company 2-10')
    expect(page).to have_content('Company 11-50')
    select "2-10", from: "size"
    click_on "Submit"
    expect(page).to have_content('Company 2-10')
    expect(page).not_to have_content('Company 11-50')
  end
end