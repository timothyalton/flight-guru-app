class WelcomeController < ApplicationController

  def homepage
    @user = User.new
    @users = User.all

  end
end