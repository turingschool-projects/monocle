class SessionsController < ApplicationController
  def show
    render layout: false
  end

  def new
    redirect_uri = if ENV["RAILS_ENV"].in?(["test", "development"])
      "http%3A%2F%2F0.0.0.0%3A3000%2Fauth%2Fslack%2Fcallback"
    else
      "https%3A%2F%2Fturingmonocle.herokuapp.com%2Fauth%2Fslack%2Fcallback"
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
puts "Signed in successfully."
      redirect_to root_path, notice: "Signed in successfully."
    else
puts "Sign in unsuccessful. Please try again."
      redirect_to root_path, warning: "Sign in unsuccessful. Please try again."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out successfully."
  end
end
