require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:city) }
  it { should belong_to(:state) }
  it { should belong_to(:zip_code) }
end
