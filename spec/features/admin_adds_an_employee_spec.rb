require 'rails_helper'

RSpec.describe "As an admin" do
  context 'When I visit /company/1' do
    xit "I can add an employed alumnus" do
      admin_logs_in
      company = create(:company)

      visit company_path(company)
      click_on "[+]"
      fill_in :first_name, with: "Michael"
      fill_in :last_name, with: "Scherer"

      expect(current_path).to eq(company_page(company))
      expect(company.employees.first.first_name).to eq("Michael")
      expect(company.employees.first.last_name).to eq("Scherer")
      within('#employee-section') do
        expect(page).to have_content("Michael Scherer")
      end
    end
  end
end
