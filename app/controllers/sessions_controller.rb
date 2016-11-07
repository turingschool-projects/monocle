class SessionsController < ApplicationController
  def create
    if SlackService.authenticate(params)

    else

    end
    params[:code]
    params[:error]
  end
end
