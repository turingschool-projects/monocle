require 'rails_helper'

RSpec.describe 'admin approves of company' do
  context 'visiting approval page' do
    it 'sees list of newly added companies and approves them' do
      VCR.use_cassette('company_creation') do
        admin_logs_in
        company = create_unapproved_company('Test Company')
        visit admin_companies_approval_path
        click_on 'Approve'
        company.reload

        expect(page).to have_content('Company information updated')
        expect(company.approved?).to eq(true)
      end
    end

    scenario "an added but unapproved company's name is present" do
      admin_logs_in
      company = create_unapproved_company('Test Company')
      visit admin_companies_approval_path

      expect(page).to have_content('Test Company')
    end

    scenario "the company's name is a link to that company's show" do
      admin_logs_in
      company = create_unapproved_company('Test Company')
      visit admin_companies_approval_path

      click_on "Test Company"

      expect(current_path).to eq(company_path(company))
    end

    it 'sees list of newly added companies and approves them' do
      VCR.use_cassette('new_company_creation') do
        admin_logs_in
        company = create_unapproved_company('Testy Company')
        visit admin_companies_approval_path
        click_on 'Approve'
        company.reload

        expect(page).to have_content('Company information updated')
        expect(company.approved?).to eq(true)
        expect(company.size).to_not eq(nil)
      end
    end
  end
end
