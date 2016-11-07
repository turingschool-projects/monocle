require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:slack_uid) }
  it { should validate_presence_of(:slack_access_token) }
  it { should validate_uniqueness_of(:slack_uid) }
end
