require 'rails_helper'

RSpec.describe 'api/v1/companies/:id/admin' do
  context 'POST /api/v1/companies/:id/admin/employees' do
    it "should add an employee" do
      admin_logs_in
      user = create(:user)
      first_name = user.username.split(' ').first
      last_name = user.username.split(' ').last
      company = create(:company)

      params = {
        first_name: first_name,
        last_name: last_name
      }

      post "/api/v1/companies/#{company.id}/admin/employees", params: params

      expect(response).to be_success
      expect(company.employees.first.first_name).to eq(first_name)
      expect(company.employees.first.last_name).to eq(last_name)
    end
  end
end
