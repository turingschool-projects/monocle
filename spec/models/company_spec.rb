require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should belong_to(:industry) }
  it { should have_many(:starred_companies) }
  it { should have_many(:addresses) }
  it { should have_many(:users) }
end
