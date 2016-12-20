require 'rails_helper'

RSpec.describe "LookingFor service" do
  it "can get a collection of jobs" do
    VCR.use_cassette "lookingFor" do
      jobs = LookingForService.recent_jobs

      expect(jobs).to be_a(Array)
      expect(jobs.first).to be_a(Job)
    end
  end
end
