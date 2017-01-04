class JobsController < ApplicationController
  def index
    @jobs = LookingForService.recent_jobs
  end
end
