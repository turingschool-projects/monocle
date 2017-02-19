require 'rails_helper'

RSpec.describe 'api/v1/EmployeesController' do
  context 'DELETE /api/v1/companies/:id/employees' do
    it "should delete the company_id on use" do
      user = create(:user)
      company = create(:company)

      delete "/api/v1/companies/#{company.id}/employees/#{user.id}"

      expect(response).to be_success
      expect(company.employees).to eq([])
      expect(user.company_id).to eq(nil)
    end
  end
end
