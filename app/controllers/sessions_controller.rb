class SessionsController < ApplicationController
  def show
    render layout: false
  end

  def new
    slack_url = "https://slack.com/oauth/authorize?" +
      "scope=identity.basic,identity.team,identity.avatar&" +
      "client_id=#{ENV['slack_client_id']}"
    redirect_to slack_url
  end

  def create
    if user = SlackService.authenticate(params)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in successfully."
    else
      redirect_to root_path, warning: "Sign in unsuccessful. Please try again."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out successfully."
  end
end
