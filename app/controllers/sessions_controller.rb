class SessionsController < ApplicationController
  def create
    user = User.update_or_create(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    flash[:success] = "Logged in as #{user.first_name} #{user.last_name}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "Logged Out"
  end
end
