require 'rails_helper'

describe 'As a logged in user' do

  before(:each) do
    user_logs_in
  end

  context 'when I visit a company show page' do
    let(:company) { company = create_approved_company("Test Company") }

    scenario 'I see add findings box' do
      visit company_path(company)

      expect(page).to have_content("Add Findings")
    end

    scenario "I enter my findings" do
      visit company_path(company)

      select '2', from: 'finding_viability'
      check 'finding_hiring'
      click_on "Submit findings"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("Findings")
      expect(page).to have_content("Viability")
      expect(page).to have_content("2")
      expect(page).to have_content("Hiring?")
      expect(page).to have_content("true")
    end
  end
end
