require 'rails_helper'

RSpec.describe 'api/v1/companies/:id/admin/employees' do
  it "should add an employee" do
    admin_logs_in
    user = User.first
    company = create(:company)

    post "/api/v1/companies/#{company.id}/admin/employees"

    expect(response).to be_success
    expect(company.employees.first).to eq(user)
  end

  end
end
