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
        # @booking = Booking.new(booking_params)
        @flights = Flight.all
        available_flight = @flights.find do |f|
            f.number == params[:booking][:number]
        end

        if available_flight
            new_booking = Booking.new(user_id: @user.id, flight_id: available_flight.id)

            if new_booking.valid?
                new_booking.save
                flash[:booking_created] = "Flight added"
                redirect_to user_path(@user)
            else
                flash[:errors] = new_booking.errors.full_messages
                redirect_to new_booking_path
            end
        else
            set_flash_errors << "Flight not found" 
            redirect_to new_booking_path
        end

    end

    def destroy
        @booking.destroy
        flash[:flight_removed] = "Flight removed"
        redirect_to @user
    end

    #### these methods don't work here. They can go in model, and use "self" instead of @booking ####
    # def departure_time 
    #     byebug
    #     if @booking.flight.departure_time
    #         DateTime.iso8601(@booking.flight.departure_time).strftime("%m-%d-%Y / %I:%M%p")
    #     else
    #         "Departure time not listed"
    #     end
    # end
    
    # def arrival_time
    #     if @booking.flight.arrival_time
    #         DateTime.iso8601(@booking.flight.arrival_time).strftime("%m-%d-%Y / %I:%M%p")
    #     else
    #         "Arrival time not listed"
    #     end
    # end
    ###############################################################################################

    private

    def current_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:user_id, :flight_id)
    end

end

