require 'rails_helper'

RSpec.describe StarredCompany, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:company) }
end
