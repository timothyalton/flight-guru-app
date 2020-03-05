class ApplicationController < ActionController::Base
  before_action :authenticated

  def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticated
    set_flash_errors << "You are not logged in"
    redirect_to root_path unless logged_in?
  end

  def set_flash_errors
    flash[:errors] ? flash[:errors] : flash[:errors] = []
  end

  def redirect_if_logged_in
      redirect_to @user if logged_in?
  end
end
