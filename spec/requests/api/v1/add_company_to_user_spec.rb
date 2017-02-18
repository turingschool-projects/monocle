require 'rails_helper'

RSpec.describe 'api/v1/EmployeesController' do
  context 'PUT /api/v1/companies/:id/employees' do
    it "should add a company to a user" do
      # user_logs_in
      user = create(:user)
      company = create(:company)
      params = { user_id: user.id}

      put "/api/v1/companies/#{company.id}/employees", params: params

      expect(User.first.employer).to eq(company)
      expect(company.employees.first).to eq(user)
    end
  end
end
