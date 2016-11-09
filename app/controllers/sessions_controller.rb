class SessionsController < ApplicationController
  def show
    render layout: false
  end

  def new
puts "***4*** #{SlackService.sign_in_uri}"
    redirect_to SlackService.sign_in_uri
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
