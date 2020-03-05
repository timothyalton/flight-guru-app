class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

  # def new 
  #   redirect_if_logged_in
  # end

  def create
    @user = User.find_by(username: params[:username])

    if params[:username] == ""
      set_flash_errors << "Please enter a username"
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user == nil
      set_flash_errors << "Account not found"
      redirect_to root_path
    else
      set_flash_errors << "Incorrect password"
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    # flash.delete(:errors) if flash[:errors]
    flash[:logout_message] = "You have logged out of your account"
    # byebug
    redirect_to root_path
  end

end