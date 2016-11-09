class SessionsController < ApplicationController
  def show
    render layout: false
  end

  def new
    redirect_uri = if ENV["RAILS_ENV"] == "test" || "development"
      "http://0.0.0.0:3000/auth/slack/callback"
    else
      "https://turingmonocle.herokuapp.com/auth/slack/callback"
    end
    slack_url = "https://slack.com/oauth/authorize?" +
      "scope=identity.basic,identity.team,identity.avatar&" +
      "client_id=#{ENV['slack_client_id']}&" +
      "redirect_uri=#{redirect_uri}"
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
