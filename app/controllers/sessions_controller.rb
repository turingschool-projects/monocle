class SessionsController < ApplicationController
  def create
    if user = SlackService.authenticate(params)

    else

    end
  end
end
