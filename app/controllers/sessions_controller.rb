class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

  def new 
    if session[:user_id]
      redirect_to User.find(session[:user_id])
    end
  end

  # def create # without authentication
  #   @user = User.find_by(username: params[:username])
  #   redirect_to @user
  # end

  def create # with authentication
    @user = User.find_by(username: params[:username])


    if params[:username] == ""
      unless flash[:errors]
        flash[:errors] = []
      end
      flash[:errors] << "Please enter a username"
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user == nil
      unless flash[:errors]
        flash[:errors] = []
      end
      flash[:errors] << "Account not found"
      redirect_to root_path
    else
      unless flash[:errors]
        flash[:errors] = []
      end
      flash[:errors] << "Incorrect password"
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    if flash[:errors]
      flash[:errors].clear
    end
    flash[:logout_message] = "You have logged out of your account"
    redirect_to root_path
  end
end