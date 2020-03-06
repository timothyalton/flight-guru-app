class AnalyticsController < ApplicationController
  skip_before_action :authenticated, only: [:index]

  def index
    @users = User.all
    @booking = Booking.all
    @flights = Flight.all

  end
end
