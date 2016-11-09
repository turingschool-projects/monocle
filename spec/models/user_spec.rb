require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:slack_uid) }
  it { should validate_presence_of(:slack_access_token) }
  it { should validate_uniqueness_of(:slack_uid) }
  it { should have_many(:starred_companies) }
  it { should have_many(:companies) }

  context "When given valid slack user info" do
    it "creates a new user" do
      user_info = {"ok"=>true,
                   "access_token"=>"xoxp-xxxxxxxxxx",
                   "user"=>{"name"=>"Calaway",
                            "id"=>"U19B6D05R"}}

      new_user = User.create_from_slack(user_info)

      expect(new_user).to be_an_instance_of(User)
      expect(new_user).to eq(User.last)
      expect(new_user.username).to eq("Calaway")
      expect(new_user.slack_uid).to eq("U19B6D05R")
      expect(new_user.slack_access_token).to eq("xoxp-xxxxxxxxxx")
    end
  end

  context "When given invalid slack user info" do
    it "returns false and does not create a new user" do
      user_info = {"ok"=>true,
                   "access_token"=>"xoxp-xxxxxxxxxx",
                   "user"=>{"name"=>nil,
                            "id"=>"U19B6D05R"}}

      result = User.create_from_slack(user_info)

      expect(result).to eq(false)
      expect(User.count).to eq(0)
    end
  end

  context "When slack authentication is false" do
    it "returns false and does not create a new user" do
      user_info = {"ok"=>false,
                   "access_token"=>"xoxp-xxxxxxxxxx",
                   "user"=>{"name"=>"Calaway",
                            "id"=>"U19B6D05R"}}

      result = User.create_from_slack(user_info)

      expect(result).to eq(false)
      expect(User.count).to eq(0)
    end
  end

  it "can star a company" do
    user = create(:user)
    company = create(:company)

    expect{user.star(company)}.to change{user.companies.count}.from(0).to(1)
  end

  it "cannot star an already starred company" do
    user = create(:user)
    company = create(:company)

    user.star(company)
    expect{user.star(company)}.to_not change{user.companies.count}.from(1)
  end
end
