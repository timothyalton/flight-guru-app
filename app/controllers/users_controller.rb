class UsersController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]
  before_action :find_booking, only: [:booking_selection_id]

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def index
    @users = User.all
  end

  # def booking_selection_id
  #   redirect_to booking_path(@booking)
  # end

      def booking_selection_id
        if @booking
        redirect_to booking_path(@booking)
        else
          set_flash_errors << "No flights found. Please add a flight"
          redirect_to @user
        end
    end


  def show
    # byebug
    @flights = @user.flights
    if session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      flash[:signup_message] = "You have created a new account, please sign in"
      redirect_to root_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  private

  def find_booking
    # byebug
    @booking = @user.bookings.find_by(flight_id: params[:id])
  end
 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end