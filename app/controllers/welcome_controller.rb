class WelcomeController < ApplicationController

  def homepage
    # @user = User.new
    @users = User.all

    # url = 'http://api.aviationstack.com/v1/flights?access_key=16e6c3c05aa63a516a8b6ea32be8a235'
    url = 'http://api.aviationstack.com/v1/flights?access_key=16e6c3c05aa63a516a8b6ea32be8a235&flight_iata=WN1653'

    pp @response = HTTParty.get(url)["data"][2]["arrival"]

  end
end