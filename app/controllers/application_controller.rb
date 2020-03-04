class ApplicationController < ActionController::Base
  before_action :authenticated

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticated
    unless flash[:errors]
      flash[:errors] = []
    end
    flash[:errors] << "You are not logged in."
    redirect_to root_path unless logged_in?
  end
end
