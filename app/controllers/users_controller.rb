class UsersController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]
  validates :username, uniqueness: true

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def create
    byebug
  end

  def create
    byebug
    user = User.new(user_params)

    if user.valid?
      user.save
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end