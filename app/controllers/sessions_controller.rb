class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    byebug
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        return_url = session[:return_url].present? ? session[:return_url] : root_url
        session[:return_url] = nil
        redirect_to return_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        render 'home/index'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
