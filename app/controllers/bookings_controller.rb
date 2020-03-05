class BookingsController < ApplicationController

    before_action :current_booking, only: [:show, :edit, :update, :destroy, :booking_selection_id]
    
    def index
        @flights = Flight.all
        @bookings = Booking.all
    end

    def show 

    end

    def booking_selection_id
        redirect_to booking_path(@booking)
    end

    def new
        # @flights = Flight.all
        @booking = Booking.new
    end

    def create
        # byebug
        # @booking = Booking.new(booking_params)
        @flights = Flight.all
        available_flight = @flights.find do |f|
            f.number == params[:booking][:number]
        end
        # byebug
        if available_flight == nil
            redirect_to new_booking_path
        else
        Booking.create(user_id: @user.id, flight_id: available_flight.id)
        # @booking.save
        redirect_to user_path(@user)
        end


    end


    private

    def current_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:user_id, :flight_id)
    end



end

