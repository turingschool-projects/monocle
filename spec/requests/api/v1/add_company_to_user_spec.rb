require 'rails_helper'

RSpec.describe 'api/v1/EmployeesController' do
  context 'PUT /api/v1/companies/:id/employees' do
    it "should add a company to a user" do
      user = create(:user)
      company = create(:company)

      put '/api/v1/companies/:id/employees', params: user.id.to_json

      expect(user.employer).to eq(company)
      expect(company.employees.first).to eq(user)
    end
  end
end
