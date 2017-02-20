require 'rails_helper'

RSpec.describe 'api/v1/EmployeesController' do
  context 'DELETE /api/v1/companies/:id/employees' do
    it "should delete the company_id on use" do
      company = create(:company)
      employee = create(:employee, company: company)

      delete "/api/v1/companies/#{company.id}/employees/#{employee.id}"

      expect(response).to be_success
      expect(company.employees).to eq([])
      expect(Employee.count).to eq(0)
    end
  end
end
