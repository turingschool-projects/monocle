class SessionsController < ApplicationController
  def show
    if current_user
      redirect_to companies_path
    else
      render layout: false
    end
  end

  def new
    redirect_to '/auth/slack'
  end

  def create
    @user = User.where(slack_uid: auth_hash[:uid]).first_or_create
    byebug
    #self.current_user = @user
    session[:user_id] = @user.id
    redirect_to root_path, flash: { success: "Signed in successfully." }
    #if user = SlackService.authenticate(params)
    #  session[:user_id] = user.id
    #  redirect_to root_path, flash: { success: "Signed in successfully." }
    #else
    #  redirect_to root_path, flash: { warning: "Sign in unsuccessful. Please try again." }
    #end
  end

  def destroy
    reset_session
    redirect_to root_path, flash: { success: "Signed out successfully." }
  end
  
  private
    def auth_hash
      request.env['omniauth.auth']
    end
end
