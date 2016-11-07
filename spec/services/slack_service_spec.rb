require 'rails_helper'

RSpec.describe SlackService, type: :service do
  context "Slack validation failed" do
    it "returns false" do
      params = {"error"=>"access_denied", "state"=>"", "controller"=>"sessions", "action"=>"create"}

      expect(SlackService.authenticate(params)).to eq(false)

      params = {"state"=>"", "controller"=>"sessions", "action"=>"create"}

      expect(SlackService.authenticate(params)).to eq(false)
    end
  end

  context "Slack validation succeded" do
    xit "returns a user object" do
      params = {"code"=>"2329094327.101187647029.9d607fd56c", "state"=>"", "controller"=>"sessions", "action"=>"create"}

      expect(SlackService.authenticate(params)).to_not eq(false)
      expect(SlackService.authenticate(params)).to_be an_instance_of(User)
    end
  end

  it "can exchange a code for slack user info" do
    
  end
end
