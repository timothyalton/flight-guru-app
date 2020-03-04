class BookingsController < ApplicationController

    before_action :current_booking, only: [:show, :edit, :update, :destroy, :booking_selection_id]
    
    def index
        @bookings = Booking.all
    end

    def show 

    end

    def booking_selection_id
        redirect_to booking_path(@booking)
    end


    private

    def current_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:ticket_number, :user_id, :flight_id)
    end



end
