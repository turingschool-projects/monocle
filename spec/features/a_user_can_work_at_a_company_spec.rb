require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'when I navigate to the company show page' do
    it "I see a button that says 'I work here'" do
      user_logs_in
      company = create(:company)

      visit company_path(company)

      expect(page).to have_content("I work here")
    end
    it "I can work at the company" do
      user_logs_in
      user = User.first
      company = create(:company)

      visit company_path(company)
      click_on "I work here"

      expect(user.employer).to eq(company)
      expect(company.employees.first).to eq(user)
    end
    it "disables the 'I work here button' when I'm an employee" do
      user_logs_in
      user = User.first
      company = create(:company)
      company.employees << user

      visit company_path(company)

      expect(page).to have_button('I work here', disabled: true)
    end
  end
end
