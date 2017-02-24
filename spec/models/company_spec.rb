require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:company_industries) }
  it { should have_many(:starred_companies) }
  it { should have_many(:locations) }

  it "should respond to users" do
    company = Company.new

    expect(company).to respond_to(:users)
  end

  it { should validate_presence_of(:name)}
end
