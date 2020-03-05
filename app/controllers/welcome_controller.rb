class WelcomeController < ApplicationController
  skip_before_action :authenticated, only: [:homepage]

  def homepage
    redirect_if_logged_in
    # byebug
    # if logged_in?
    #   @user = User.find(session[:user_id])
    # end
  end
  
end