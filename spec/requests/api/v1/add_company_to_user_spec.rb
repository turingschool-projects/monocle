require 'rails_helper'

RSpec.describe 'api/v1/EmployeesController' do
  context 'POST /api/v1/companies/:id/employees/new' do
    it "should add a company to a user" do
      user_logs_in
      user = User.first
      company = create(:company)

      post "/api/v1/companies/#{company.id}/employees"

      expect(response).to be_success
      expect(user.employer).to eq(company)
      expect(company.employees.first).to eq(user)
    end
  end
end
