require 'rails_helper'

RSpec.describe 'moderator approves of company' do
  it 'sees list of newly added companies and approves them' do
    moderator_logs_in
    create_unapproved_company('Test Company')
    visit moderator_companies_approval_path
    click_on 'Disapprove'

    expect(page).to_not have_content('Test Company')
    expect(Company.last.status).to eq('disapproved')
  end
end
