class Terminal < ApplicationRecord
    has_many :flights
    has_many :restaurants
    has_many :bookings, through: :flights
    has_many :users, through: :bookings

# @restaurant_data_by_terminal = HTTParty.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Terminal+A+at+IAH&key=AIzaSyBE_4_oQR77YTzAD4d4Bh2LBWbGdB_mqzc')


    def self.total_number_of_restaurants
      Restaurant.all.count
    end

    def self.average_number_of_restaurants
      (total_number_of_restaurants.to_f/Terminal.count).round(2)
    end

end
