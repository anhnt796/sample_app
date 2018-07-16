class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        user_auth user
      else
        flash[:warning] = t ".not_activated"
        redirect_to root_url
      end
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def check_box user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def user_auth user
    log_in user
    check_box user
    redirect_back_or user
  end
end
