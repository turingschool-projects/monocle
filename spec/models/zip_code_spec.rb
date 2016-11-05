require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  it { should have_many(:companies) }
end
