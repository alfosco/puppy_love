class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    flash[:success] = "Logged in as #{user.name}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "Logged Out"
  end
end
