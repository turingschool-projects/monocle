require 'rails_helper'

RSpec.describe SlackService, type: :service do
  context "Slack validation returns error" do
    it "#authenticate returns false" do
      params = {"error"=>"access_denied",
                "state"=>"",
                "controller"=>"sessions",
                "action"=>"create"}

      expect(SlackService.authenticate(params)).to eq(false)
    end
  end

  context "Slack validation returns no code" do
    it "#authenticate returns false" do
      params = {"state"=>"",
                "controller"=>"sessions",
                "action"=>"create"}

      expect(SlackService.authenticate(params)).to eq(false)
    end
  end

  context "We send an incorrect code to Slack" do
    it "#authenticate returns false" do
      VCR.use_cassette("invalid_slack_code") do
        params = {"code"=>"xxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxx",
                  "state"=>"",
                  "controller"=>"sessions",
                  "action"=>"create"}

        expect(SlackService.authenticate(params)).to eq(false)
      end
    end
  end

  context "Slack validation succeded" do
    it "returns a user object" do
      VCR.use_cassette("DO_NOT_DELETE_exchange_slack_code_for_token") do
        params = {"code"=>"2329094327.101587274741.f2ae6e812d",
                  "state"=>"",
                  "controller"=>"sessions",
                  "action"=>"create"}

        expect(SlackService.authenticate(params)).to eq(false)
        expect(SlackService.authenticate(params)).to_be an_instance_of(User)
      end
    end
  end
end
