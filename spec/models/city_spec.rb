require 'rails_helper'

RSpec.describe City, type: :model do
  it { should have_many(:locations) }
end
