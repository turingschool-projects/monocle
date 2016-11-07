class SessionsController < ApplicationController
  def create
    if SlackService.authenticate(params)

    else

    end
  end
end
