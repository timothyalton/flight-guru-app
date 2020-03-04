class UsersController < ApplicationController
  before_action :set_user, only: (:show)

  def index
    @users = User.all
  end

  def show
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      redirect_to user
    else
      # flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end


  # def user_needing_id
  #   redirect_to @user
  # end

  private
 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def set_user
    # byebug
    @user = User.find(params[:id])
  end
end
